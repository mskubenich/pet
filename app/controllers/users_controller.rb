class UsersController < ApplicationController
  def create
  end

  def profile
    @user = current_user
  end
end
