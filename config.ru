require 'fileutils'
require 'logger'
require 'sequel'
require 'pact_broker'

ENV['RACK_ENV'] ||= 'production'

# Create a real database, and set the credentials for it here
# It is highly recommended to set the encoding to utf8
DATABASE_CREDENTIALS = {
  adapter: "mysql2",
  database: "pact_broker",
  :encoding => 'utf8',
  username: 'root',
  password: ''
}

ENV['TZ'] = 'Australia/Melbourne' # Set the timezone you want your dates to appear in

app = PactBroker::App.new do | config |
  # change these from their default values if desired
  # config.log_dir = "./log"
  config.auto_migrate_db = true
  config.database_connection = Sequel.connect(DATABASE_CREDENTIALS.merge(:logger => PactBroker::DB::LogQuietener.new(config.logger)))
end

run app
