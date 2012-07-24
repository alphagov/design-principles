DesignPrinciples::Application.routes.draw do

  get "/designprinciples", :to => "root#designprinciples"
  get "/designprinciples/styleguide", :to => "root#styleguide"
  get "/designprinciples/performanceframework", :to => "root#performanceframework"

  root :to => redirect("/designprinciples")
end
