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

 def initialize(params = {})
  params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

end
