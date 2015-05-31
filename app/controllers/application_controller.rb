class ApplicationController < ActionController::Base

  include ApplicationHelper
  include SessionsHelper

  protect_from_forgery with: :exception

  before_filter :authenticate_user

  rescue_from Exception, with: :catch_exceptions

  before_filter :set_locale

  private

  def catch_exceptions(e)

    if e.kind_of? CanCan::AccessDenied
      render json: 'Access Denied !', status: :unauthorized and return
    end

    raise
  end

  def authenticate_user
    if current_session && current_user
      if (Time.now - current_session.updated_at > 1.hour)
        current_session.destroy
        bad_request ['Session invalid or expired!'], nil, 401
        return
      end
      current_session.updated_at = Time.now
      current_session.save!
    else
      bad_request ['Session invalid or expired!'], nil, 401
    end
  end

  def bad_request(errors, options, status = 200)
    redirect_to root_path and return
  end

  def set_locale
    I18n.locale = params[:locale] || 'ru'
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end

end
