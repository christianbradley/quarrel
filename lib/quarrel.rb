require 'quarrel/version'
require 'quarrel/parser'
require 'quarrel/parameter'

module Quarrel

  def self.unset? value
    Quarrel::Parameter.unset? value
  end

  def self.values data, *args
    Quarrel::Controller.new(data, *args).values
  end

  def self.set_instance_variables target, data, *args
    Quarrel::Controller.new(data, *args).set_instance_variables target
  end

  class Controller 
    attr_reader :data, :args

    def initialize data, *args
      raise ArgumentError,
	"Must provide one or more specifications for named parameters." if args.empty?
      @data, @args = data, args
    end

    def params
      Quarrel::Parser.parse(args, Quarrel::Parameter)
    end

    def values
      params.each_with_object(data).map &:apply
    end

    def pairs
      params.each_with_object(data).map do |param, data|
	[param.name, param.apply(data)]
      end
    end

    def set_instance_variables target
      pairs.each do |(name, value)|
	target.instance_variable_set :"@#{name}", value
      end
    end

  end

end
