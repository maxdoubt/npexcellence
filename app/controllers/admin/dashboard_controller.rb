class Admin::DashboardController < Admin::ApplicationController

  def show
    redirect_to admin_pages_path
  end

end