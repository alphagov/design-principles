require 'gds_api/rummager'
require 'search_result'
require 'design_principles'

class SearchController < ApplicationController
  def index
    render_404 and return unless DesignPrinciples.expose_search?

    set_expiry

    response.headers[Slimmer::Headers::SEARCH_PATH_HEADER] = '/service-manual/search'

    res = search_client.search(params[:q])
    @search_term = params[:q]
    @results = res.map { |r| SearchResult.new(r) }
  rescue GdsApi::Rummager::SearchServiceError => e
    @results = ["HELP!"]
  end

  protected

  def search_client
    @search_client ||= GdsApi::Rummager.new(Plek.current.find('search') + '/service-manual')
  end

  def set_expiry(duration = 30.minutes)
    unless Rails.env.development?
      expires_in(duration, :public => true)
    end
  end
end
