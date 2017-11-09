class StyleguideController < ApplicationController
  before_action :set_expiry
  before_action :load_changes

  def index
    respond_to do |format|
      format.atom do
        render "whats-new"
      end
    end
  end

private
  def load_changes
    @changes = Change.all
  end
end
