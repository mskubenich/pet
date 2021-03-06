class ServicesController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:create, :failure]
  skip_before_filter :verify_authenticity_token

  def create
    # render json: { auth: request.env['omniauth.auth'], params: params} and return
    omniauth = request.env['omniauth.auth']
    if omniauth && params[:service]
      if params[:service] == 'facebook'
        @name =     omniauth['info']['name']  ? omniauth['info']['name']  : ''
        @uid =      omniauth['uid']           ? omniauth['uid']           : ''
        @provider = omniauth['provider']      ? omniauth['provider']      : ''
        @image =    omniauth['info']['image'] ? omniauth['info']['image'] : ''
      end
      if params[:service] == 'vkontakte'
        @name =     omniauth['info']['name']  ? omniauth['info']['name']  : ''
        @uid =      omniauth['uid']           ? omniauth['uid']           : ''
        @provider = omniauth['provider']      ? omniauth['provider']      : ''
        @image =    omniauth['info']['image'] ? omniauth['info']['image'] : ''
      end
      if params[:service] == 'odnoklassniki'
        @name =     omniauth['info']['name']  ? omniauth['info']['name']  : ''
        @uid =      omniauth['uid']           ? omniauth['uid']           : ''
        @provider = omniauth['provider']      ? omniauth['provider']      : ''
        @image =    omniauth['info']['image'] ? omniauth['info']['image'] : ''
      end
      if params[:service] == 'mailru'
        @name =     omniauth['info']['name']  ? omniauth['info']['name']  : ''
        @uid =      omniauth['uid']           ? omniauth['uid']           : ''
        @provider = omniauth['provider']      ? omniauth['provider']      : ''
        @image =    omniauth['info']['image'] ? omniauth['info']['image'] : ''
      end

      if @uid != '' and @provider != ''
        @service = Service.where(uid: @uid).try(:first)

        if @service.nil?
          @service = Service.create(uid: @uid, uname: @name, provider: @provider, uimage: @image)

          @user = User.new
          @user.service = @service
          @user.save

          @service.user_id = @user.id
          @service.save

          @user.reload
        else
          @user = @service.user
        end
        sign_in @user
        redirect_to root_path
      else
        render text: 'Error while authenticating via ' + params[:service] + '.'
      end
    else
        render text: 'Error while authenticating via ' + params[:service] + '..'
    end
  end

  def failure
    render json: { auth: request.inspect, params: params}
  end

end