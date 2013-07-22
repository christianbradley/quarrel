require 'spec_helper'
require 'quarrel'

describe "Quarrel" do

  it "returns values from named parameters" do
    city, state, zip, country = Quarrel.values({
      :city => "Austin", :state => "TX", :zip => "78756"
    }, :city, :state, :zip?, :country=, "US")

    city.must_equal "Austin"
    state.must_equal "TX"
    zip.must_equal "78756"
    country.must_equal "US"
  end

  it "sets instance variables from named parameters" do
    instance = mock
    instance.expects(:instance_variable_set).with(:@city, "Austin")
    instance.expects(:instance_variable_set).with(:@state, "TX")
    instance.expects(:instance_variable_set).with(:@zip, "78756")
    instance.expects(:instance_variable_set).with(:@country, "US")

    Quarrel.set_instance_variables(instance, {
      :city => "Austin", :state => "TX", :zip => "78756"
    }, :city, :state, :zip?, :country=, "US")
  end

  it "checks for unset values" do
    city, state, zip, country = Quarrel.values({
      :city => "Austin", :state => "TX"
    }, :city, :state, :zip?, :country=, "US")

    Quarrel.unset?(zip).must_equal true
  end

  it "raises when parameters are unspecified" do
    e = lambda { Quarrel.values :foo => "bar" }.must_raise ArgumentError
    e.message.must_equal "Must provide one or more specifications for named parameters."
  end
end
