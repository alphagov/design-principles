# encoding: utf-8
require "spec_helper"

describe Terms do
  it "should parse the CSV without error" do
    Terms.dictionary
  end

  it "should have a term and an explanation for each entry" do
    Terms.dictionary.values.each do |letter|
      # Each letter has an array of definitions
      letter.each do |definition|
        # definition should have the term and the explanation. Anything else is
        # probably bad quoting in the CSV
        definition.should have_key('term')
        definition.should have_key('explanation')

        definition.length.should == 2
      end
    end
  end
end
