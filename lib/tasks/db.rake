require "active_record"
require "yaml"

include ActiveRecord::Tasks

DatabaseTasks.database_configuration = YAML.load_file("config/database.yml")
DatabaseTasks.env = ENV["DB_ENV"] || "test"

ActiveRecord::Base.configurations = DatabaseTasks.database_configuration

namespace :db do
  task :create do
    DatabaseTasks.create_current
  end

  task :drop do
    DatabaseTasks.drop_current
  end

  task :migrate do
    DatabaseConnection.new(DatabaseTasks.env)

    migration_path = File.expand_path(
      "../../../db", __FILE__
    )

    puts "Migrating #{migration_path}"

    ActiveRecord::Migrator.migrate(migration_path)
  end
end
