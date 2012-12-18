class ApplicationController < ActionController::Base
  protect_from_forgery

  include ApplicationHelper

  def admin_user
		redirect_to root_path, flash: {error: t('flash.error.only.admin')} unless user_signed_in? && current_user.admin
  end
end
