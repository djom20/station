class WelcomeController < ApplicationController 

  def index
    redirect_to dashboard_path if user_signed_in?
  end

  def home
  end

  def stats
  end


end
