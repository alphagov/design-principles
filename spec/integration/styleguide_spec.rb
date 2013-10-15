require 'spec_helper'

describe "The styleguide page" do

  it "should render without blowing up" do
    visit "/designprinciples/styleguide"

    page.should have_content("Content style guide")
    page.should have_content("Americanisms")
  end

  it "should render answers" do
    visit "/designprinciples/styleguide/answers"

    page.should have_content("Content style guide")
    page.should have_content("answer 'National Minimum Wage rate'")
  end

  it "should render benefits and schemes" do
    visit "/designprinciples/styleguide/benefits-and-schemes"

    page.should have_content("Content style guide")
    page.should have_content("calculations")
  end

  it "should render case studies" do
    visit "/designprinciples/styleguide/case-studies"

    page.should have_content("Content style guide")
    page.should have_content("avoid creating too many case studies")
  end

  it "should render consultations" do
    visit "/designprinciples/styleguide/consultations"

    page.should have_content("Content style guide")
    page.should have_content("Use for consultations, calls for evidence and requests")
  end

  it "should render corporate information" do
    visit "/designprinciples/styleguide/corporate-information"

    page.should have_content("Content style guide")
    page.should have_content("Appears under the \u2018Corporate information\u2019 heading on the organisation home page")
  end

  it "should render detailed guides" do
    visit "/designprinciples/styleguide/detailed-guides"

    page.should have_content("Content style guide")
    page.should have_content("Detailed guides answer a specific user need")
  end

  it "should render government responses" do
    visit "/designprinciples/styleguide/government-responses"

    page.should have_content("Content style guide")
    page.should have_content("Use for government statements in response to coverage")
  end

  it "should render guides" do
    visit "/designprinciples/styleguide/guides"

    page.should have_content("Content style guide")
    page.should have_content("Part 1' of the guide should contain")
  end

  it "should render images" do
    visit "/designprinciples/styleguide/images"

    page.should have_content("Content style guide")
    page.should have_content("Use images only when they give useful additional context or information")
  end

  it "should render news stories and press releases" do
    visit "/designprinciples/styleguide/news-stories-and-press-releases"

    page.should have_content("Content style guide")
    page.should have_content("News stories are different from press releases")
  end

  it "should render organisation homepage" do
    visit "/designprinciples/styleguide/organisation-homepage"

    page.should have_content("Content style guide")
    page.should have_content("These are the links at the top right of the home page")
  end

  it "should render people and roles" do
    visit "/designprinciples/styleguide/people-and-roles"

    page.should have_content("Content style guide")
    page.should have_content("Use these pages to let people know who is responsible for running the organisation")
  end

  it "should render policy advisory groups" do
    visit "/designprinciples/styleguide/policy-advisory-groups"

    page.should have_content("Content style guide")
    page.should have_content("Use for profiling groups of expert advisers")
  end

  it "should render policy pages" do
    visit "/designprinciples/styleguide/policy-pages"

    page.should have_content("Content style guide")
    page.should have_content("A policy is how the government plans to achieve a specific outcome")
  end

  it "should render publications" do
    visit "/designprinciples/styleguide/publications"

    page.should have_content("Content style guide")
    page.should have_content("Publication pages should be short and straightforward")
  end

  it "should render speeches" do
    visit "/designprinciples/styleguide/speeches"

    page.should have_content("Content style guide")
    page.should have_content("Use this content type to provide a direct record of what someone said")
  end

  it "should render statements to Parliament" do
    visit "/designprinciples/styleguide/statements-to-parliament"

    page.should have_content("Content style guide")
    page.should have_content("Use this content type for very significant statements given to Parliament by a minister")
  end

  it "should render what's new" do
    visit "/designprinciples/styleguide/whats-new"

    page.should have_content("information about style updates on this page")
  end

  it "should render writing for the web" do
    visit "/designprinciples/styleguide/writing-for-the-web"

    page.should have_content("Content style guide")
    page.should have_content("writing well for the web is very different")
  end
end
