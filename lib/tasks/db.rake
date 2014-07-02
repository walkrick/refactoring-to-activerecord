namespace :db do
  desc "migrate your database"
  task :migrate do
    Database.connection.establish!
    ActiveRecord::Migrator.migrate('./db/migrate')
  end
end
