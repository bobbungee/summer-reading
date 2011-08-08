class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :clear_course
  
  def clear_course
    cookies.permanent[:course] = nil
  end
end
