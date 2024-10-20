class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_notifications, if: :current_user
  before_action :set_up_search_bar

  private

  def set_up_search_bar
    @query = Post.ransack(params[:query])
  end

  def set_notifications
    @unread_notifications = current_user.notifications.unread
    @read_notifications = current_user.notifications.read
  end
end
