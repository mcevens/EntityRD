require_relative 'db_connection'
require_relative 'db_object'

module Filterable
  def where(filter_params)
    filter_condition = filter_params.keys.map { |key| "#{key} = ?" }.join(" AND ")

    results = DBConnection.execute(<<-SQL, *filter_params.values)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{filter_condition}
    SQL

    parse_all(results)
  end
end

class SQLObject
  extend Filterable
end
