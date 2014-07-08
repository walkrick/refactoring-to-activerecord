require "active_record"
require "yaml"

include ActiveRecord::Tasks

DatabaseTasks.database_configuration = YAML.load_file("config/database.yml")
DatabaseTasks.env = ENV["DB_ENV"] || "test"

ActiveRecord::Base.configurations = DatabaseTasks.database_configuration

def root_dir
  File.expand_path(
    "../../..", __FILE__
  )
end

namespace :db do
  task :create do
    DatabaseTasks.create_current
  end

  task :drop do
    DatabaseTasks.drop_current
  end

  task :migrate do
    DatabaseConnection.new(DatabaseTasks.env)
    migration_path = root_dir + "/db"
    puts "Migrating #{migration_path}"

    ActiveRecord::Migrator.migrate(migration_path)
  end

  task :rollback do
    DatabaseConnection.new(DatabaseTasks.env)
    migration_path = root_dir + "/db"
    puts "Migrating #{migration_path}"

    ActiveRecord::Migrator.rollback(migration_path)
  end

  task :create_migration do
    puts "What is the name of the migration? Use snakecase, i.e. name_of_migration"
    migration_name = STDIN.gets.chomp
    migration_class_name = migration_name.split("_").map(&:capitalize).join
    timestamp = Time.now.to_i
    migration_file_name = root_dir + "/db/migrate/#{timestamp}_#{migration_name}.rb"

    file = File.new(migration_file_name, "w+")

    file.puts(<<-TEMPLATE)
class #{migration_class_name} < ActiveRecord::Migration
  def up
    # add migration code here
  end

  def down
    # add reverse migration code here
  end
end
TEMPLATE
    file.close
    puts "migration created: #{migration_file_name}"
  end
end
