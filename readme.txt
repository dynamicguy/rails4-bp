rails g scaffold company comp_id:pk comp_name status:integer hidden:boolean created_time:integer modified_time:integer created_uid modified_uid global_admin:integer:1 website phone ssl:integer:1

======================

rails g scaffold project prj_id:integer prj_name site_address start_topic:integer created_time:integer modified_time:integer created_uid modified_uid master:boolean domain private:boolean keyword_index:boolean theme token default_view user_view:boolean show_folder_icon:boolean show_page_icon:boolean toc_font_size toc_line_height primary_site:integer lang is_primary_lang:boolean link_lang_sites:boolean ckfinder_delete:boolean favicon toc_visible:boolean filter_visible:boolean toc_width:integer toc_bg_color toc_bold_folder:boolean toc_font_family enable_mobile:boolean phone_home tablet_home:boolean enable_mobile_css:boolean -p

rails g scaffold folder name parent_id:integer project_id:integer import_id:integer deleted:boolean:false hidden:boolean:0 toc_open:boolean link_url

rails g scaffold folder name parent_id:integer project_id:integer import_id:integer deleted:boolean:false hidden:boolean:0 toc_open:boolean link_url --force
