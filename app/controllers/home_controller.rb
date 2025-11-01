class HomeController < ApplicationController
  allow_unauthenticated_access

  def index
    if authenticated?
      redirect_to dashboard_path
    else
      session[:previous_path] = home_path
    end
  end
end
