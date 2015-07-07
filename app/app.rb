require 'bundler/setup'
require 'sinatra'
require 'pg'

# @connection = PG::Connection.new(
#   hostaddr: ENV['POSTGRES_PORT_5432_TCP_ADDR'],
#   port: ENV['POSTGRES_PORT_5432_TCP_PORT'],
#   dbname: 'sinatra',
#   user: 'sinatra',
#   password: 'sinatra'
# )

get '/' do
  "#{ENV['POSTGRES_PORT_5432_TCP_ADDR']} Hello from sinatra"
end
