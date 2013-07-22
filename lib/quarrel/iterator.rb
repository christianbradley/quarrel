module Quarrel

  class Iterator
    attr_reader :position

    def initialize subject
      @subject = subject
      rewind
    end

    def rewind
      @position = -1
    end

    def next?
      position < @subject.size-1
    end

    def next
      raise StopIteration, "Iteration reached an end" unless next?
      @position += 1
      @subject.at position
    end

  end

end
