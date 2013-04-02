class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles, :options => 'ENGINE=NDB'  do |t|
      t.string :name
      t.string :content
      t.datetime :published_on
    end
  end
end
