module Quarrel
  module Duck 
    def self.symbolic? subject
      subject.respond_to?(:to_sym) && subject.to_sym == subject
    end
  end
end
