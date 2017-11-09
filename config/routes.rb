Rails.application.routes.draw do

  get "/design-principles", :to => "root#designprinciples"

  get "/design-principles/style-guide", :to => "styleguide#index"

  get "/design-principles/accessiblepdfs", :to => "root#accessiblepdfs"
  get "/design-principles/performanceframework", :to => "root#performanceframework"

  root :to => redirect("/design-principles")
end
