require 'spec_helper'

describe "The designprinciples page" do
  it "should render without blowing up" do
    visit "/designprinciples"

    page.should have_content("Design Principles")
    page.should have_content("Start with needs")
  end
end

describe "The area-specific pages" do
  it "should redirect the mainstream page to content formats" do
    visit "/designprinciples/mainstream"
    page.should have_content("Americanisms")
  end

  it "should redirect the detailed guidance page to content formats" do
    visit "/designprinciples/detailedguides"
    page.should have_content("Detailed guides answer a specific user need")
  end

  it "should redirect the Inside Gov page to content formats" do
    visit "/designprinciples/insidegovernment"
    page.should have_content("Use the active rather than passive voice")
  end

  it "should redirect the seo page to part of writing for GOV.UK" do
    visit "/designprinciples/seo"
    page.should have_content("Google Analytics Search Terms")
  end
end

describe "The style guide" do
  it "should render" do
    visit "/designprinciples/styleguide"
    page.should have_content("Content style guide")
    page.should have_content("Americanisms")
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
    page.should have_content("information about style updates on this page")
  end
end

describe "The Performance Framework page" do
  it "should render" do
    visit "/designprinciples/performanceframework"
    page.should have_content("Performance Framework")
  end
end

