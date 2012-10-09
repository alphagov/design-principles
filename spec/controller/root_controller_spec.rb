require "spec_helper"

describe RootController, :type => :controller do
  describe "30 min cache headers" do
    it "should be for design principles" do
      get :designprinciples
      response.headers["Cache-Control"].should == "max-age=1800, public"
    end

    it "should be for styleguide" do
      get :styleguide
      response.headers["Cache-Control"].should == "max-age=1800, public"
    end

    it "should be for performance framework" do
      get :performanceframework
      response.headers["Cache-Control"].should == "max-age=1800, public"
    end
  end
end
