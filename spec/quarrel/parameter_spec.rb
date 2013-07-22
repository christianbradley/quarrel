require 'spec_helper'
require 'quarrel/parameter'

describe "Required Parameter" do

  subject { Quarrel::Parameter.required :city }

  it "sets the value from supplied data" do
    subject.apply(:city => "Austin").must_equal "Austin"
  end

  it "can be set" do
    subject.set("Austin").must_equal "Austin"
  end

  it "cannot be unset" do
    e = lambda { subject.unset }.must_raise ArgumentError
  end

end

describe "Optional Parameter" do

  subject { Quarrel::Parameter.optional :city }

  it "can be unset" do
    Quarrel::Parameter.unset?(subject.unset).must_equal true
  end

end

describe "Defaulted Parameter" do
  subject { Quarrel::Parameter.defaulted :city, "Austin" }

  it "uses the default value when unset" do
    subject.unset.must_equal "Austin"
  end
end
