require 'spec_helper'

describe "The styleguide page" do

  it "should render without blowing up" do
    visit "/design-principles/style-guide"

    page.should have_content("Content style guide")
    page.should have_content("GOV.UK is for anyone")
  end

  it "should render answers" do
    visit "/design-principles/style-guide/answers"

    page.should have_content("Content style guide")
    page.should have_content("answer 'National Minimum Wage rate'")
  end

  it "should render benefits and schemes" do
    visit "/design-principles/style-guide/benefits-and-schemes"

    page.should have_content("Content style guide")
    page.should have_content("calculations")
  end

  it "should render case studies" do
    visit "/design-principles/style-guide/case-studies"

    page.should have_content("Content style guide")
    page.should have_content("avoid creating too many case studies")
  end

  it "should render consultations" do
    visit "/design-principles/style-guide/consultations"

    page.should have_content("Content style guide")
    page.should have_content("Use for consultations, calls for evidence and requests")
  end

  it "should render corporate information" do
    visit "/design-principles/style-guide/corporate-information"

    page.should have_content("Content style guide")
    page.should have_content("Appears under the \u2018Corporate information\u2019 heading on the organisation home page")
  end

  it "should render detailed guides" do
    visit "/design-principles/style-guide/detailed-guides"

    page.should have_content("Content style guide")
    page.should have_content("Detailed guides answer a specific user need")
  end

  it "should render government responses" do
    visit "/design-principles/style-guide/government-responses"

    page.should have_content("Content style guide")
    page.should have_content("Use for government statements in response to coverage")
  end

  it "should render guides" do
    visit "/design-principles/style-guide/guides"

    page.should have_content("Content style guide")
    page.should have_content("Part 1' of the guide should contain")
  end

  it "should render images" do
    visit "/design-principles/style-guide/images"

    page.should have_content("Content style guide")
    page.should have_content("Use images only when they give useful additional context or information")
  end

  it "should render news stories and press releases" do
    visit "/design-principles/style-guide/news-stories-and-press-releases"

    page.should have_content("Content style guide")
    page.should have_content("News stories are different from press releases")
  end

  it "should render organisation homepage" do
    visit "/design-principles/style-guide/organisation-homepage"

    page.should have_content("Content style guide")
    page.should have_content("These are the links at the top right of the home page")
  end

  it "should render people and roles" do
    visit "/design-principles/style-guide/people-and-roles"

    page.should have_content("Content style guide")
    page.should have_content("Use these pages to let people know who is responsible for running the organisation")
  end

  it "should render policy advisory groups" do
    visit "/design-principles/style-guide/policy-advisory-groups"

    page.should have_content("Content style guide")
    page.should have_content("Use for profiling groups of expert advisers")
  end

  it "should render policy pages" do
    visit "/design-principles/style-guide/policy-pages"

    page.should have_content("Content style guide")
    page.should have_content("A policy is how the government plans to achieve a specific outcome")
  end

  it "should render publications" do
    visit "/design-principles/style-guide/publications"

    page.should have_content("Content style guide")
    page.should have_content("Publication pages should be short and straightforward")
  end

  it "should render speeches" do
    visit "/design-principles/style-guide/speeches"

    page.should have_content("Content style guide")
    page.should have_content("Use this content type to provide a direct record of what someone said")
  end

  it "should render statements to Parliament" do
    visit "/design-principles/style-guide/statements-to-parliament"

    page.should have_content("Content style guide")
    page.should have_content("Use this content type for very significant statements given to Parliament by a minister")
  end

  it "should render what's new" do
    visit "/design-principles/style-guide/whats-new"

    page.should have_content("information about style updates on this page")
  end

  it "should render writing for the web" do
    visit "/design-principles/style-guide/writing-for-the-web"

    page.should have_content("Content style guide")
    page.should have_content("writing well for the web is very different")
  end

  describe "secondary navigation" do
    it "should be hidden when showing other parts of the style guide" do
      visit "/design-principles/style-guide/whats-new"

      page.should_not have_css("section.open-section")
    end

    describe "when active" do
      it "should show the navigation" do
        visit "/design-principles/style-guide/answers"

        page.should have_css("section.open-section")
      end

      it "should highlight the current navigation" do
        visit "/design-principles/style-guide/answers"

        page.should have_css("a.current")
      end
    end
  end
end
