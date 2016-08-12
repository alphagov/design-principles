require 'spec_helper'

describe "The performanceframework page", type: :feature do

  it "should render without blowing up" do
    visit "/design-principles/performanceframework"

    page.should have_content("Performance Framework")
  end
end

