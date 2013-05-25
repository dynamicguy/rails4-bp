class SetClusterStorage < ActiveRecord::Migration
  def change
    execute 'ALTER TABLE articles ENGINE = NDBCLUSTER;'
    execute 'ALTER TABLE countries ENGINE = NDBCLUSTER;'
    execute 'ALTER TABLE countrylanguages ENGINE = NDBCLUSTER;'
    execute 'ALTER TABLE cities ENGINE = NDBCLUSTER;'
    execute 'ALTER TABLE pages ENGINE = NDBCLUSTER;'
    execute 'ALTER TABLE categories ENGINE = NDBCLUSTER;'
    execute 'ALTER TABLE users ENGINE = NDBCLUSTER;'
  end
end
