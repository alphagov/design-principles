require 'spec_helper'
require 'csv'

describe "The A to Z CSV" do
  it "should contain exactly 2 columns" do
    CSV.foreach(Rails.root.join('db', 'a-z.csv'), headers: true) do |row|
      row.length.should == 2
    end
  end
end
