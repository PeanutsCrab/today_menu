class PagesController < ApplicationController
skip_before_action :require_login, only: %i[contact terms privacy]

  def contact; end
  def terms; end
  def privacy; end
end