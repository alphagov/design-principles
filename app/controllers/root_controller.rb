class RootController < ApplicationController
  before_action :set_expiry

  def designprinciples
  end

  def styleguide
  end

  def performanceframework
  end

  def insidegovernment
    render "inside-government"
  end

  def mainstream
  end

  def detailedguides
    render "detailed-guides"
  end

  def accessiblepdfs
    render "accessible-pdfs"
  end

  def whatsnew
    render "whats-new"
  end

  def seo
    render "seo"
  end
end
