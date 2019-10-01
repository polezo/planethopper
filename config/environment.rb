require 'bundler/setup'
Bundler.require
# set :database_file, "./database.yml"

# require 'sinatra/activerecord'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/development.sqlite"
)

ActiveRecord::Base.logger = nil

require_all 'app'

