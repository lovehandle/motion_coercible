motion_require 'stubs.rb'
motion_require 'support/descendants_tracker'
motion_require 'support/type_lookup'
motion_require 'support/options'

module Coercible
  EXTRA_CONST_ARGS = (RUBY_VERSION < '1.9' ? [] : [ false ]).freeze

  UnsupportedCoercion = Class.new(StandardError)

  # Test for rubinius platform
  #
  # @return [true]
  #   if running under rubinius
  #
  # @return [false]
  #   otherwise
  #
  # @api private
  def self.rbx?
    @is_rbx ||= defined?(RUBY_ENGINE) && RUBY_ENGINE == 'rbx'
  end
end
