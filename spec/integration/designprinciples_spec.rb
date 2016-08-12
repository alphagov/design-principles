require 'spec_helper'

describe "The designprinciples page", type: :feature do
  it "should render without blowing up" do
    visit "/design-principles"

    page.should have_content("Design Principles")
    page.should have_content("Start with needs")
  end
end

describe "The accessible PDFs page", type: :feature do
  it "should render" do
    visit "/design-principles/accessiblepdfs"
    page.should have_content("Accessible PDFs")
  end
end

describe "The Performance Framework page", type: :feature do
  it "should render" do
    visit "/design-principles/performanceframework"
    page.should have_content("Performance Framework")
  end
end

