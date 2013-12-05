require 'spec_helper'

describe "The designprinciples page" do
  it "should render without blowing up" do
    visit "/design-principles"

    page.should have_content("Design Principles")
    page.should have_content("Start with needs")
  end
end

describe "The area-specific pages" do
  it "should redirect the mainstream page to content formats" do
    visit "/design-principles/mainstream"
    page.should have_content("GOV.UK is for anyone")
  end

  it "should redirect the detailed guidance page to content formats" do
    visit "/design-principles/detailedguides"
    page.should have_content("Detailed guides answer a specific user need")
  end

  it "should redirect the Inside Gov page to content formats" do
    visit "/design-principles/insidegovernment"
    page.should have_content("Use the active rather than passive voice")
  end

  it "should redirect the seo page to part of writing for GOV.UK" do
    visit "/design-principles/seo"
    page.should have_content("Google Analytics Search Terms")
  end
end

describe "The style guide" do
  it "should render" do
    visit "/design-principles/style-guide"
    page.should have_content("Content style guide")
    page.should have_content("GOV.UK is for anyone")
  end
end

describe "The accessible PDFs page" do
  it "should render" do
    visit "/design-principles/accessiblepdfs"
    page.should have_content("Accessible PDFs")
  end
end

describe "The what's new page" do
  it "should render the What's New page" do
    visit "/design-principles/whatsnew"
    page.should have_content("information about style updates on this page")
  end
end

describe "The Performance Framework page" do
  it "should render" do
    visit "/design-principles/performanceframework"
    page.should have_content("Performance Framework")
  end
end

