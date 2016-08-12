require 'spec_helper'

describe "The styleguide page", type: :feature do

  it "should render an Atom feed" do
    visit '/design-principles/style-guide.atom'
    page.should have_content('GDS Content style guide changes')
  end

end
