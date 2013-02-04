require 'spec_helper'

describe "The designprinciples page" do
  it "should render without blowing up" do
    visit "/designprinciples"

    page.should have_content("Design Principles")
    page.should have_content("Start with needs")
  end
end

describe "The area-specific pages" do
  it "should render the mainstream page" do
    visit "/designprinciples/mainstream"
    page.should have_content("Style differences: Mainstream")
  end

  it "should render the detailed guidance page" do
    visit "/designprinciples/detailedguides"
    page.should have_content("Detailed guides")
  end

  it "should render the Inside Gov page" do
    visit "/designprinciples/insidegovernment"
    page.should have_content("Inside Government content types")
  end
end

describe "The style guide" do
  it "should render" do
    visit "/designprinciples/styleguide"
    page.should have_content("Style guide")
  end
end

describe "The accessible PDFs page" do
  it "should render" do
    visit "/designprinciples/accessiblepdfs"
    page.should have_content("Accessible PDFs")
  end
end

describe "The what's new page" do
  it "should render the What's New page" do
    visit "/designprinciples/whatsnew"
    page.should have_content("What\u2019s new")
  end
end

describe "The Performance Framework page" do
  it "should render" do
    visit "/designprinciples/performanceframework"
    page.should have_content("Performance Framework")
  end
end

