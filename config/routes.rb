require 'design_principles'

DesignPrinciples::Application.routes.draw do

  get "/design-principles", :to => "root#designprinciples"

  get "/design-principles/style-guide", :to => "styleguide#index"
  get "/design-principles/style-guide/a-z", :to => "styleguide#a_z"
  get "/design-principles/style-guide/writing-for-govuk", :to => "styleguide#writing_for_govuk"
  get "/design-principles/style-guide/style-points", :to => "styleguide#style_points"
  get "/design-principles/style-guide/writing-for-the-web", :to => "styleguide#writing_for_the_web"
  get "/design-principles/style-guide/answers", :to => "styleguide#answers"
  get "/design-principles/style-guide/benefits-and-schemes", :to => "styleguide#benefits_and_schemes"
  get "/design-principles/style-guide/case-studies", :to => "styleguide#case_studies"
  get "/design-principles/style-guide/consultations", :to => "styleguide#consultations"
  get "/design-principles/style-guide/corporate-information", :to => "styleguide#corporate_information"
  get "/design-principles/style-guide/detailed-guides", :to => "styleguide#detailed_guides"
  get "/design-principles/style-guide/document-collections", :to => "styleguide#document_collections"
  get "/design-principles/style-guide/government-responses", :to => "styleguide#government_responses"
  get "/design-principles/style-guide/guides", :to => "styleguide#guides"
  get "/design-principles/style-guide/images", :to => "styleguide#images"
  get "/design-principles/style-guide/news-stories-and-press-releases", :to => "styleguide#news_stories_and_press_releases"
  get "/design-principles/style-guide/organisation-homepage", :to => "styleguide#organisation_homepage"
  get "/design-principles/style-guide/people-and-roles", :to => "styleguide#people_and_roles"
  get "/design-principles/style-guide/policy-advisory-groups", :to => "styleguide#policy_advisory_groups"
  get "/design-principles/style-guide/policy-pages", :to => "styleguide#policy_pages"
  get "/design-principles/style-guide/publications", :to => "styleguide#publications"
  get "/design-principles/style-guide/speeches", :to => "styleguide#speeches"
  get "/design-principles/style-guide/statements-to-parliament", :to => "styleguide#statements_to_parliament"
  get "/design-principles/style-guide/whats-new", :to => "styleguide#whats_new"

  # redirect the old URLs
  get "/design-principles/mainstream", :to => redirect("/design-principles/style-guide")
  get "/design-principles/insidegovernment", :to => redirect("/design-principles/style-guide/writing-for-govuk")
  get "/design-principles/detailedguides", :to => redirect("/design-principles/style-guide/detailed-guides")
  get "/design-principles/accessiblepdfs", :to => "root#accessiblepdfs"
  get "/design-principles/performanceframework", :to => "root#performanceframework"
  get "/design-principles/whatsnew", :to => redirect("/design-principles/style-guide/whats-new")
  get "/design-principles/seo", :to => redirect("/design-principles/style-guide/writing-for-govuk#seo")

  get "/:prefix/search", :to => 'search#index'
  root :to => redirect("/design-principles")
end
