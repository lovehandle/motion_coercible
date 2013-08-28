module Coercible

  # Configuration object for global and per coercer type settings
  #
  class Configuration

    # Build a configuration instance
    #
    # @param [Array] list of accessor keys
    #
    # @return [Configuration]
    #
    # @api private
    def self.build(keys, &block)
      config = new
      keys.each do |key|
        config.instance_eval do
          define_singleton_method("#{key}")  { instance_variable_get("@#{key}") }
          define_singleton_method("#{key}=") { |value| instance_variable_set("@#{key}", value) }
        end
      end
      yield(config) if block_given?
      config
    end

  end # class Configuration

end # module Coercible
