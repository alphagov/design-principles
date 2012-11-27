DesignPrinciples::Application.routes.draw do

  get "/designprinciples", :to => "root#designprinciples"
  get "/designprinciples/styleguide", :to => "root#styleguide"
  get "/designprinciples/mainstream", :to => "root#mainstream"
  get "/designprinciples/insidegovernment", :to => "root#insidegovernment"
  get "/designprinciples/performanceframework", :to => "root#performanceframework"
  get "/designprinciples/whatsnew", :to => "root#whatsnew"

  root :to => redirect("/designprinciples")
end
