require_relative 'filterable'

class LinkOptions
  attr_accessor :foreign_key, :class_name, :primary_key

  def class_object
    @class_name.constantize
  end

  def table_name
    class_object.table_name
  end
end

module Linkable

end

class SQLObject
  extend Linkable
end
