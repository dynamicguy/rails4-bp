class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topic, id: false do |t|
      t.integer :topic_id, :null => false
      t.string :topic_type
      t.string :topic_title
      t.boolean :topic_status
      t.boolean :topic_toc
      t.string :toc_name
      t.boolean :topic_index
      t.string :index_name
      t.string :topic_permalink
      t.text :topic_content
      t.integer :prj_id
      t.integer :folder_id
      t.string :deleted
      t.integer :created_time
      t.string :created_uid
      t.integer :modified_time
      t.integer :modified_uid
      t.integer :deleted_time
      t.integer :deleted_uid
      t.integer :undeleted_uid
      t.integer :undeleted_time
      t.integer :comp_id
      t.integer :topic_size
      t.boolean :has_feedback
      t.integer :good
      t.integer :bad
      t.boolean :show_in_pdf
      t.string :import_id
      t.integer :duplicated_id
      t.boolean :toc_hidden
      t.string :keywords
      t.boolean :inc_search
      t.boolean :working
      t.boolean :toc_open
    end

    execute "ALTER TABLE topic ADD PRIMARY KEY (topic_id);"
    execute "ALTER TABLE  `topic` CHANGE  `topic_id`  `topic_id` INT( 11 ) NOT NULL AUTO_INCREMENT;"

  end
end
