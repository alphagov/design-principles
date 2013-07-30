# encoding: utf-8
require "spec_helper"

describe SearchController, :type => :controller do
  def stub_client
    stub_search_client = stub("search", search: { "results" => [] })
    controller.stubs(:search_client).returns(stub_search_client)
  end

  def do_search(term = 'search-term')
    get :index, prefix: 'service-manual', q: term
  end

  before :each do
    stub_client
  end

  it "should pass our query parameter in to the search client" do
    controller.search_client.expects(:search)
                            .with("search-term")
                            .returns("results" => []).once
    do_search
  end

  it "should handle a blank query" do
    controller.search_client.expects(:search).never
    do_search('')
  end

  it "should return unlimited results" do
    controller.search_client.stubs(:search)
                            .returns("results" => Array.new(75, {}))

    do_search('Test')

    assert_equal 75, assigns(:results).length
  end
end
