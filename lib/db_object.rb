require_relative 'db_connection'
require 'active_support/inflector'

class DBObject

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.underscore.pluralize
  end

end
