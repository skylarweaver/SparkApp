class ApplicationController < ActionController::Base
	respond_to :html, :json
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :
  
  # def user_format_log(log)
  #   return log.order("created_at desc").to_a.map{|o| {created_at: o.created_at.strftime("%m/%d/%y %I:%M %p"), user_email: o.user.email}}
  # end
end
