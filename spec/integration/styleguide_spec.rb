require 'spec_helper'

describe "The styleguide page" do

  it "should render without blowing up" do
    visit "/designprinciples/styleguide"

    page.should have_content("Content style guide")
    page.should have_content("Style guide: GOV.UK")
  end
end

