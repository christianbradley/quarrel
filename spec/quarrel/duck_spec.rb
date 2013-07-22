require 'spec_helper'
require 'quarrel/duck'

describe "Duck" do

  it "determines whether or not a value is symbolic" do
    Quarrel::Duck.symbolic?(:foo?).must_equal true
    Quarrel::Duck.symbolic?(":foo?").must_equal false
  end

end
