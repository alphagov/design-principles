require 'gds_api/rummager'
require 'search_result'
require 'design_principles'

class SearchController < ApplicationController
  def index
    render_404 and return unless DesignPrinciples.expose_search?

    set_expiry

    @client = GdsApi::Rummager.new(Plek.current.find('search') + '/specialist')
    res = @client.search(params[:q])
    @results = res.map { |r| SearchResult.new(r) }
  rescue GdsApi::Rummager::SearchServiceError => e
    @results = ["HELP!"]
  end

  protected
  def set_expiry(duration = 30.minutes)
    unless Rails.env.development?
      expires_in(duration, :public => true)
    end
  end
end