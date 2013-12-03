require 'design_principles'

DesignPrinciples::Application.routes.draw do

  get "/designprinciples", :to => "root#designprinciples"

  if DesignPrinciples.display_content_formats?
    get "/designprinciples/styleguide", :to => "styleguide#index"
    get "/designprinciples/styleguide/writing-for-govuk", :to => "styleguide#writing_for_govuk"
    get "/designprinciples/styleguide/style-points", :to => "styleguide#style_points"
    get "/designprinciples/styleguide/writing-for-the-web", :to => "styleguide#writing_for_the_web"
    get "/designprinciples/styleguide/answers", :to => "styleguide#answers"
    get "/designprinciples/styleguide/benefits-and-schemes", :to => "styleguide#benefits_and_schemes"
    get "/designprinciples/styleguide/case-studies", :to => "styleguide#case_studies"
    get "/designprinciples/styleguide/consultations", :to => "styleguide#consultations"
    get "/designprinciples/styleguide/corporate-information", :to => "styleguide#corporate_information"
    get "/designprinciples/styleguide/detailed-guides", :to => "styleguide#detailed_guides"
    get "/designprinciples/styleguide/document-collections", :to => "styleguide#document_collections"
    get "/designprinciples/styleguide/government-responses", :to => "styleguide#government_responses"
    get "/designprinciples/styleguide/guides", :to => "styleguide#guides"
    get "/designprinciples/styleguide/images", :to => "styleguide#images"
    get "/designprinciples/styleguide/news-stories-and-press-releases", :to => "styleguide#news_stories_and_press_releases"
    get "/designprinciples/styleguide/organisation-homepage", :to => "styleguide#organisation_homepage"
    get "/designprinciples/styleguide/people-and-roles", :to => "styleguide#people_and_roles"
    get "/designprinciples/styleguide/policy-advisory-groups", :to => "styleguide#policy_advisory_groups"
    get "/designprinciples/styleguide/policy-pages", :to => "styleguide#policy_pages"
    get "/designprinciples/styleguide/publications", :to => "styleguide#publications"
    get "/designprinciples/styleguide/speeches", :to => "styleguide#speeches"
    get "/designprinciples/styleguide/statements-to-parliament", :to => "styleguide#statements_to_parliament"
    get "/designprinciples/styleguide/whats-new", :to => "styleguide#whats_new"

    # redirect the old URLs
    get "/designprinciples/mainstream", :to => redirect("/designprinciples/styleguide")
    get "/designprinciples/insidegovernment", :to => redirect("/designprinciples/styleguide/writing-for-govuk")
    get "/designprinciples/detailedguides", :to => redirect("/designprinciples/styleguide/detailed-guides")
    get "/designprinciples/accessiblepdfs", :to => "root#accessiblepdfs"
    get "/designprinciples/performanceframework", :to => "root#performanceframework"
    get "/designprinciples/whatsnew", :to => redirect("/designprinciples/styleguide/whats-new")
    get "/designprinciples/seo", :to => redirect("/designprinciples/styleguide/writing-for-govuk#seo")
  else
    get "/designprinciples/styleguide", :to => "root#styleguide"
    get "/designprinciples/mainstream", :to => "root#mainstream"
    get "/designprinciples/insidegovernment", :to => "root#insidegovernment"
    get "/designprinciples/detailedguides", :to => "root#detailedguides"
    get "/designprinciples/accessiblepdfs", :to => "root#accessiblepdfs"
    get "/designprinciples/performanceframework", :to => "root#performanceframework"
    get "/designprinciples/whatsnew", :to => "root#whatsnew"
    get "/designprinciples/seo", :to => "root#seo"
  end

  get "/:prefix/search", :to => 'search#index'
  root :to => redirect("/designprinciples")
end
