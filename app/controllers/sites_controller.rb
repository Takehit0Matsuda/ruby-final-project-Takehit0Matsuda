class SitesController < ApplicationController
  def index
  end
  def about
    flash.now[:notice] = "This is a notice"
    flash.now[:alert] = "This is an alert"
  end
  def components
  end
end
