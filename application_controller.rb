class ApplicationController < ActionController::Base
  # Include Pundit so we can access in every controller
  include Pundit

  # Filters
  rescue_from Pundit::NotAuthorizedError, with: :unauthorized_user
  # /Filters

  # Private methods start
  private
  def unauthorized_user
    @message = "You are not authorized to perform this action."
    @status = :forbidden
    respond_to do |format|
      format.html do
        flash[:alert] = @message
        redirect_to(request.referrer || root_path)
      end
      format.js {
        "alert(#{@message})"#only for now
      }
      format.json {
        render json: {alert: @message, status: @status}.to_json, status: @status
      }
    end
    return
  end
  # Private methods end
end
