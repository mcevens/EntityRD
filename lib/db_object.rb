require_relative 'db_connection'
require 'active_support/inflector'

class DBObject

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

 def self.finalize!
  self.columns.each do |name|
    define_method(name) do
      self.attributes[name]
    end

    define_method("#{name}=") do |value|
      self.attributes[name] = value
    end
  end
end

end
