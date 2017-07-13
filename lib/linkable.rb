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

class BelongsToOptions < LinkOptions
  def initialize(name, options = {})
  defaults = {
    :foreign_key => "#{name}_id".to_sym,
    :class_name => name.to_s.camelcase,
    :primary_key => :id
  }

  defaults.keys.each do |key|
    self.send("#{key}=", options[key] || defaults[key])
  end
end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    defaults = {
      :foreign_key => "#{self_class_name.underscore}_id".to_sym,
      :class_name => name.to_s.singularize.camelcase,
      :primary_key => :id
    }

    defaults.keys.each do |key|
      self.send("#{key}=", options[key] || defaults[key])
    end
  end
end

module Linkable

end

class SQLObject
  extend Linkable
end
