require_relative 'sql_server_connector'

@conn = SqlServerConnector.new
query = "query_string"
result = @conn.execute query

result.each do |row|
  puts row
end
