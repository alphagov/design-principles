require 'design_principles'

Rails.application.routes.draw do

  get "/design-principles", :to => "root#designprinciples"

  get "/design-principles/style-guide", :to => "styleguide#index"

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
