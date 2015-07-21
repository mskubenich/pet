class ServicesController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:create]

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
        render text: 'Error while authenticating via ' + service_route.capitalize + '.'
      end
    else
      render text: 'Error while authenticating via ' + service_route.capitalize + '.'
    end
  end

end