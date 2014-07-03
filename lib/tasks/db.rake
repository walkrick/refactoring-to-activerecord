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
    Database.connection.establish!
    ActiveRecord::Migrator.migrate('./db/migrate')
  end
end
