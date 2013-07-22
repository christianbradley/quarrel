require 'spec_helper'
require 'quarrel/iterator'

describe "Iterator" do

  let(:array) { %w(The rain in Spain) }
  let(:iterator) { Quarrel::Iterator.new array }

  subject { iterator }

  it "retrieves the next value in the array" do
    subject.next.must_equal "The"
    subject.next.must_equal "rain"
    subject.next.must_equal "in"
    subject.next.must_equal "Spain"
  end

  it "knows whether or not there is a next value" do
    assert subject.next?, "Must have a next value"
    4.times { subject.next }
    refute subject.next?, "Should not have a next value"
  end

  it "raises when it reaches the end" do
    4.times { subject.next }
    e = lambda { subject.next }.must_raise StopIteration
  end

  it "rewinds" do
    4.times { subject.next }
    subject.rewind
    subject.next.must_equal "The"
  end
end
