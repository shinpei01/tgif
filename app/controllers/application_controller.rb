class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :set_cookie, :aleady_pushed?

  private
    # def set_cookie
    #  cookies[:hoge] = { :value => 't', :expires => 1.days.from_now }
    # end

    def aleady_pushed?
      if cookies[:hoge] == 't'
        return true
      else
        return false
      end
    end
end
