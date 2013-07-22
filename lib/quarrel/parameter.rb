require 'singleton'

module Quarrel

  module Parameter

    class UnsetValue
      include Singleton
    end

    def self.unset? value
      value == UnsetValue.instance
    end

    def self.required name
      Required.new name
    end

    def self.optional name
      Optional.new name
    end

    def self.defaulted name, default
      Defaulted.new name, default
    end

    module Base
      attr_reader :name

      def initialize name
	@name = name
      end

      def apply data
	data.has_key?(name) && set(data[name]) or unset
      end

      def set value
	value
      end

      def unset 
	nil
      end

    end

    class Required
      include Base

      def unset
	raise ArgumentError, "No value provided for required parameter :#{name}"
      end
    end

    class Optional
      include Base

      def unset
	UnsetValue.instance
      end
    end

    class Defaulted
      include Base

      def initialize name, default
	@name, @default = name, default
      end

      def unset
	@default
      end
    end

  end

end
