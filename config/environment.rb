require 'bundler'
Bundler.require

require './app/models/book'
require './app/models/display_random'


configure :development do
  set :database, "sqlite3:db/database.db"
end