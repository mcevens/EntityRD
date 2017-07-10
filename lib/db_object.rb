require_relative 'db_connection'
require 'active_support/inflector'

class DBObject

  def self.columns
  return @columns if @columns
  cols = DBConnection.execute2(<<-SQL).first
    SELECT
      *
    FROM
      #{self.table_name}
    LIMIT
      0
  SQL
  cols.map!(&:to_sym)
  @columns = cols
end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.underscore.pluralize
  end

  def self.columns
   return @columns if @columns
   cols = DBConnection.execute2(<<-SQL).first
     SELECT
       *
     FROM
       #{self.table_name}
     LIMIT
       0
   SQL
   cols.map!(&:to_sym)
   @columns = cols
 end

end
