class CreateProjects < ActiveRecord::Migration
  def change
    create_table :project, id: false do |t|
      t.integer :prj_id, :null => false
      t.string :prj_name
      t.string :site_address
      t.integer :start_topic
      t.integer :created_time
      t.integer :modified_time
      t.string :created_uid
      t.string :modified_uid
      t.boolean :master
      t.string :domain
      t.boolean :private
      t.boolean :keyword_index
      t.string :theme
      t.string :token
      t.string :default_view
      t.boolean :user_view
      t.boolean :show_folder_icon
      t.boolean :show_page_icon
      t.string :toc_font_size
      t.string :toc_line_height
      t.integer :primary_site
      t.string :lang
      t.boolean :is_primary_lang
      t.boolean :link_lang_sites
      t.boolean :ckfinder_delete
      t.string :favicon
      t.boolean :toc_visible
      t.boolean :filter_visible
      t.integer :toc_width
      t.string :toc_bg_color
      t.boolean :toc_bold_folder
      t.string :toc_font_family
      t.boolean :enable_mobile
      t.string :phone_home
      t.boolean :tablet_home
      t.boolean :enable_mobile_css
    end

    execute "ALTER TABLE project ADD PRIMARY KEY (prj_id);"
    execute "ALTER TABLE  `project` CHANGE  `prj_id`  `prj_id` INT( 11 ) NOT NULL AUTO_INCREMENT;"

  end
end
