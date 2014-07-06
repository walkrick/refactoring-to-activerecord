require "sinatra"
require "active_record"
require "./lib/database_connection"

class App < Sinatra::Application
  def initialize
    super
    @database_connection = DatabaseConnection.new(ENV["RACK_ENV"])
  end

  get "/" do
    @database_connection.sql("INSERT INTO users (name) VALUES ('hello')")

    @database_connection.sql("SELECT * from users").to_s
  end
end
