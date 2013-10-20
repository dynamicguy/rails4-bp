class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :company, id: false do |t|
      t.integer :comp_id, :null => false
      t.string :comp_name
      t.integer :status
      t.boolean :hidden
      t.integer :created_time
      t.integer :modified_time
      t.string :created_uid
      t.string :modified_uid
      t.integer :global_admin
      t.string :website
      t.string :phone
      t.integer :ssl
    end
    execute "ALTER TABLE company ADD PRIMARY KEY (comp_id);"
    execute "ALTER TABLE  `company` CHANGE  `comp_id`  `comp_id` INT( 11 ) NOT NULL AUTO_INCREMENT;"
  end
end
