require 'gds_api/rummager'
require 'search_result'
require 'design_principles'

class SearchController < ApplicationController
  def index
    render_404 and return unless DesignPrinciples.expose_search?

    set_expiry

    response.headers[Slimmer::Headers::SEARCH_PATH_HEADER] = '/service-manual/search'

    @search_term = params[:q]

    if @search_term.blank?
      @results = []
    else
      res = search_client.unified_search(q: @search_term, filter_manual: "service-manual")
      @results = res["results"].map { |r| SearchResult.new(r) }
    end
  rescue GdsApi::BaseError => e
    @results = ["HELP!"]
  end

  protected

  def search_client
    @search_client ||= GdsApi::Rummager.new(Plek.current.find('rummager'))
  end

  def set_expiry(duration = 30.minutes)
    unless Rails.env.development?
      expires_in(duration, :public => true)
    end
  end
end
