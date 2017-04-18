# This module will be used for any needed validatoins

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(name, type, argument = nil)
      @validations ||= {}
      @validations[name] ||= []
      @validations[name] << { type: type, argument: argument }
    end
  end

  module InstanceMethods
    def valid?
      validate
      true
    rescue RuntimeError
      false
    end

    def validate!
      self.class.validations.each do |var, validations|
        var_value = instance_variable_get("@#{var}".to_sym)
        validations.each do |validation|
          method_name = "validate_#{validation[:type]}".to_sym
          send(method_name, var_value, validation[:argument])
        end
      end
    end

    private

    def validate_presence(value, _arg)
      raise 'Value is nil or empty' if value.nil?
    end
  end
end
