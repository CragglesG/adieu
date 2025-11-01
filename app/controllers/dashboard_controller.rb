class DashboardController < ApplicationController
  def index
    @ads = Ad.where(user_id: Current.user.id)
    session[:previous_path] = dashboard_path
  end
end
