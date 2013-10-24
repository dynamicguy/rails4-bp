# chef/site-cookbooks/main/recipes/default.rb

# setup

rbenv_ruby node['ruby-version']
rbenv_global node['ruby-version']

rbenv_gem 'bundler'

group 'admin' do
  gid 420
end

user node[:user][:name] do
  password node[:user][:password]
  gid 'admin'
  home "/home/#{node[:user][:name]}"
  shell '/bin/bash'
  supports :manage_home => true
end

directory "#{node[:deploy_to]}/tmp/sockets" do
  owner node[:user][:name]
  group 'admin'
  recursive true
end

# certificates

directory "#{node[:deploy_to]}/certificate" do
  owner node[:user][:name]
  recursive true
end

cookbook_file "#{node[:deploy_to]}/certificate/#{node[:environment]}.crt" do
  source "#{node[:environment]}.crt"
  action :create_if_missing
end

cookbook_file "#{node[:deploy_to]}/certificate/#{node[:environment]}.key" do
  source "#{node[:environment]}.key"
  action :create_if_missing
end

# configuration

template '/etc/nginx/sites-enabled/default' do
  source 'nginx.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, 'service[nginx]'
end

["sv", "service"].each do |dir|
  directory "/home/#{node[:user][:name]}/#{dir}" do
    owner node[:user][:name]
    group 'admin'
    recursive true
  end
end

runit_service "runsvdir-#{node[:user][:name]}" do
  default_logger true
end

runit_service 'rails4bp' do
  sv_dir "/home/#{node[:user][:name]}/sv"
  service_dir "/home/#{node[:user][:name]}/service"
  owner node[:user][:name]
  group 'admin'
  restart_command '2'
  restart_on_update false
  default_logger true
end

service 'nginx'
