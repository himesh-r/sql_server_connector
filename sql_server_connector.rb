require 'yaml'
require 'tiny_tds'

class SqlServerConnector
  attr_accessor :client, :config

  # Sql Connector Object
  def initialize(options = {})
    @config = connection_config
    @client = initialize_client
  end

  # Initialize new TinyTds Client connection object
  def initialize_client
    TinyTds::Client.new @config
  end

  # Load database configurations from yml
  def connection_config
    symbolize_keys YAML.load_file('db_config.yml')['sql_server']
  end

  # This method symbolizes keys of connection config hash loaded from db_config file
  def symbolize_keys(h)
    h.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
  end

  # Execute query
  def execute(query)
    @client.execute(query)
  end
end
