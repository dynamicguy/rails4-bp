class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :site_address
      t.integer :topic_id
      t.string :created_uid
      t.string :modified_uid
      t.boolean :master, default: false
      t.string :domain
      t.boolean :private, default: false
      t.boolean :keyword_index, default: false
      t.string :theme
      t.string :token
      t.string :default_view, default: 'tab'
      t.boolean :user_view, default: false
      t.boolean :show_folder_icon, default: false
      t.boolean :show_page_icon, default: false
      t.string :toc_font_size, default: '11px'
      t.string :toc_line_height, default: '18px'
      t.integer :primary_site
      t.string :lang, default: 'en'
      t.boolean :primary_lang, default: true
      t.boolean :link_lang_sites, default: false
      t.boolean :ckfinder_delete, default: false
      t.string :favicon
      t.boolean :toc_visible, default: true
      t.boolean :filter_visible, default: true
      t.integer :toc_width
      t.string :toc_bg_color
      t.boolean :toc_bold_folder, default: false
      t.string :toc_font_family
      t.boolean :enable_mobile, default: false
      t.string :phone_home
      t.boolean :tablet_home, default: false
      t.boolean :enable_mobile_css, default: false

      t.timestamps
    end
  end
end
