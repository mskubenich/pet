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
    render json: {error: 'Access Denied!'}, status: status and return if request.xhr?
    redirect_to root_path and return
  end

  def set_locale
    locale = params[:locale] || cookies[:locale ] || 'ru'
    locale = 'ru' unless ['ru', 'en'].include?(locale)
    I18n.locale = locale
    cookies.permanent[:locale] = I18n.locale
    gon.locale = I18n.locale
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end

end