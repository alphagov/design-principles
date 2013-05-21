DesignPrinciples::Application.routes.draw do

  get "/designprinciples", :to => "root#designprinciples"
  get "/designprinciples/styleguide", :to => "root#styleguide"
  get "/designprinciples/mainstream", :to => "root#mainstream"
  get "/designprinciples/insidegovernment", :to => "root#insidegovernment"
  get "/designprinciples/detailedguides", :to => "root#detailedguides"
  get "/designprinciples/accessiblepdfs", :to => "root#accessiblepdfs"
  get "/designprinciples/performanceframework", :to => "root#performanceframework"
  get "/designprinciples/whatsnew", :to => "root#whatsnew"
  get "/designprinciples/seo", :to => "root#seo"

  get "/:prefix/search", :to => 'search#index'
  root :to => redirect("/designprinciples")
end
