require 'spec_helper'
require 'quarrel/parser'

describe "Parser" do
  let(:city) { stub :city }
  let(:state) { stub :state }
  let(:zip) {  stub :zip }
  let(:country) { stub :country }
  let(:factory) { mock }
  let(:words) { [:city, :state, :zip?, :country=, "US"] }
  let(:parser) { Quarrel::Parser.new words, factory }

  before do
    factory.stubs(:required)
    factory.stubs(:optional)
    factory.stubs(:defaulted)
  end

  it "parses words into associated parameter types" do
    factory.expects(:required).with(:city).returns city
    factory.expects(:required).with(:state).returns state
    factory.expects(:optional).with(:zip).returns zip
    factory.expects(:defaulted).with(:country, "US").returns country
    parser.parse.must_equal [city, state, zip, country]
  end

  describe "no default value provided" do
    let(:words) { [:city, :state, :zip?, :country=] }

    it "raises a syntax error" do
      e = lambda { parser.parse }.must_raise SyntaxError
    end
  end

  describe "invalid syntax" do
    let(:words) { [:city, "some value", :state, :zip?] }
    it "raises a syntax error" do
      e = lambda { parser.parse }.must_raise SyntaxError
    end
  end

end
