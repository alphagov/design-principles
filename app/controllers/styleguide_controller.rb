class StyleguideController < ApplicationController
  before_filter :set_expiry
  before_filter :load_changes

  def index
    respond_to do |format|
      format.html { render "writing-for-govuk" }
      format.atom do
        render "whats-new"
      end
    end
  end

  def writing_for_govuk
    render "writing-for-govuk"
  end

  def writing_for_the_web
    render "writing-for-the-web"
  end

  def style_points
    render "style-points"
  end

  def answers
  end

  def benefits_and_schemes
    render "benefits-and-schemes"
  end

  def case_studies
    render "case-studies"
  end

  def consultations
  end

  def corporate_information
    render "corporate-information"
  end

  def detailed_guides
    render "detailed-guides"
  end

  def document_collections
  end

  def government_responses
    render "government-responses"
  end

  def groups
  end

  def guides
  end

  def images
  end

  def news_stories_and_press_releases
    render "news-stories-and-press-releases"
  end

  def organisation_homepage
    render "organisation-homepage"
  end

  def people_and_roles
    render "people-and-roles"
  end

  def policy_pages
    render "policy-pages"
  end

  def speeches
  end

  def statements_to_parliament
    render "statements-to-parliament"
  end

  def publication_scheme
  end

  def whats_new
    render "whats-new"
  end

  def a_z
    render "a-z"
  end

private
  def load_changes
    @changes = Change.all
  end
end
