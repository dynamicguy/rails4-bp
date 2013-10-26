#!/usr/bin/env ruby

=begin
Capistrano deployment email notifier for Rails 3

Do you need to send email notifications after application deployments?

Christopher Sexton developed a Simple Capistrano email notifier for rails. You can find details at http://www.codeography.com/2010/03/24/simple-capistrano-email-notifier-for-rails.html.

Here is Rails 3 port of the notifier.

The notifier sends an email after application deployment has been completed.

How to use it?

 1. Add this file to config/deploy folder.
 2. Update the file with your google credentials and from email address.
 3. Add the following content to config/deploy.rb.

    require 'config/deploy/cap_notify.rb'

    # add email addresses for people who should receive deployment notifications
    set :notify_emails, ["EMAIL1@YOURDOMAIN.COM", "EMAIL2@YOURDOMAIN.COM"]

    after :deploy, 'deploy:send_notification'

    # Create task to send a notification
    namespace :deploy do
      desc "Send email notification"
      task :send_notification do
        Notifier.deploy_notification(self).deliver
      end
    end

 4. Update deploy.rb with destination email addresses for the notifications.
 5. To test run this command:

    cap deploy:send_notification

=end

require "action_mailer"

ActionMailer::Base.delivery_method = :smtp
#ActionMailer::Base.default_url_options = {:host => 'localhost:3000'}
#config.action_mailer.default_url_options = {:host => 'localhost:3000'}
ActionMailer::Base.default :charset => "utf-8"

ActionMailer::Base.smtp_settings = {
    address: "smtp.mailgun.org",
    port: 25,
    domain: "rs9499.mailgun.org",
    authentication: :login,
    user_name: 'postmaster@rs9499.mailgun.org',
    password: '6vw8xeiho5s9',
    enable_starttls_auto: true
}

class Notifier < ActionMailer::Base
  default :from => "postmaster@rs9499.mailgun.org"

  def deploy_notification(cap_vars)
    now = Time.now
    subject = "#{`sh -c 'git log -i -1 --pretty="format:%an <%ae>" --author="$1"'`.rstrip} Performed a deploy operation on #{now.strftime("%m/%d/%Y")} at #{now.strftime("%I:%M %p")} to #{cap_vars.host}"
    @change_log = "HERE IS THE LAST 10 COMMIT MESSAGES\n\n" + `git log --stat -n 10`
    mail(:to => cap_vars.notify_emails, :subject => subject, :body => @change_log)
  end
end