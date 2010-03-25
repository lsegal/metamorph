require_relative '../ext/metamorph'

class Object
  def self.method_added(name)
    return if name == :initialize
    const_set(:InstanceMethods, Module.new) unless defined?(self::InstanceMethods)
    self::InstanceMethods.add_method(name, instance_method(name))
    remove_method(name)
    include self::InstanceMethods
  end
end
