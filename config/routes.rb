DesignPrinciples::Application.routes.draw do

  get "/design-principles", :to => "root#design-principles"
  get "/designprinciples/styleguide", :to => "root#styleguide"
  get "/designprinciples/mainstream", :to => "root#mainstream"
  get "/designprinciples/inside-government", :to => "root#inside-government"
  get "/designprinciples/detailed-guides", :to => "root#detailed-guides"
  get "/designprinciples/accessible-pdfs", :to => "root#accessible-pdfs"
  get "/designprinciples/performanceframework", :to => "root#performanceframework"
  get "/designprinciples/whats-new", :to => "root#whats-new"

  root :to => redirect("/designprinciples")
end
