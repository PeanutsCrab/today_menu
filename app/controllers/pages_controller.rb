class PagesController < ApplicationController
skip_before_action :require_login, only: %i[terms privacy use]

  def terms; end
  def privacy; end
  def line; end
  def use; end
end