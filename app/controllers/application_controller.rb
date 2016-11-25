class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?

  protected

    def current_user
      @current_user ||= find_user_by_session
    end

    def ensure_logged_in
      if !current_user
        redirect_to(home_url, notice: 'You are not logged in!')
      end
    end

    def find_user_by_session
      if session[:user_id].present?
        User.find_by(id: session[:user_id])
      end
    end

    def signed_in?
      !!current_user
    end

    def sign_in(user)
      session[:user_id] = user.id
    end

    def ensure_anonymous
      if signed_in?
        redirect_to(home_url, notice: 'You are already logged in!')
      end
    end

end
