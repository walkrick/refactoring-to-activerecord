namespace :db do
  desc "migrate your database"
  task :migrate do
    require 'bundler'
    Bundler.require
    DB::Connection.establish
    ActiveRecord::Migrator.migrate('./db/migrate')
  end
end
