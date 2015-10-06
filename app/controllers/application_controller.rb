class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :turn_off_report_a_problem

  include Slimmer::Template
  slimmer_template 'wrapper'

protected
  def set_expiry(duration = 30.minutes)
    unless Rails.env.development?
      expires_in(duration, :public => true)
    end
  end

  def turn_off_report_a_problem
    response.headers[Slimmer::Headers::REPORT_A_PROBLEM_FORM] = "false"
  end
end
