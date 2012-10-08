require 'spec_helper'

describe "The designprinciples page" do
  it "should render without blowing up" do
    visit "/designprinciples"

    page.should have_content("Design Principles")
    page.should have_content("Start with needs")
  end
end
