require 'quarrel/duck'
require 'quarrel/iterator'

module Quarrel

  class Parser

    def self.parse words, factory
      new(words, factory).parse
    end

    attr_reader :words, :factory

    def initialize words, factory
      @words = words
      @factory = factory
    end

    def parse
      i = Quarrel::Iterator.new @words
      results = []

      loop do
	word = i.next

	if Quarrel::Duck.symbolic?(word) && name = word[/^([a-z_]\w*)$/, 1]
	  results << factory.required(name.to_sym)

	elsif Quarrel::Duck.symbolic?(word) && name = word[/^([a-z_]\w*)\?$/, 1]
	  results << factory.optional(name.to_sym)

	elsif Quarrel::Duck.symbolic?(word) && name = word[/^([a-z_]\w*)\=$/, 1]
	  raise SyntaxError,
	    "Expected default value for :#{name} " +
	  "at position #{i.position+1}: #{words.inspect}" unless i.next?

	  results << factory.defaulted(name.to_sym, i.next)
	else 
	  raise SyntaxError,
	    "Expected parameter specification at position #{i.position}, " +
	    "got #{word.inspect}: #{words.inspect}"
	end

      end

      results
    end

  end

end
