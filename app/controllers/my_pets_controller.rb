class MyPetsController < ApplicationController

  load_and_authorize_resource :my_pet

  def index
    @user = User.where(id: params[:user_id].to_i).first
    @user = current_user unless @user
    @pets = @user.pets.order('created_at DESC')
  end

  def create
    attachments_params = params[:pet][:photos] || []
    @pet = MyPet.new pet_params.merge({user_id: current_user.id})
    if @pet.save
      attachments_params.each do |attachment|
        Attachment.create entity_id: @pet.id, entity_type: MyPet, file: attachment
      end
      render json: {ok: true}
    else
      render json: {errors: @pet.errors}, status: :unprocessable_entity
    end
  end

  def update
    attachments_params = params[:pet][:photos] || []
    if @my_pet.update_attributes pet_params
      attachments_params.each do |attachment|
        Attachment.create entity_id: @my_pet.id, entity_type: MyPet, file: attachment
      end
      @my_pet.attachments.where(id: params[:pet][:removed_photos]).destroy_all
      render json: {ok: true}
    else
      render json: {errors: @my_pet.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    MyPet.find(params[:id]).destroy
    render json: {ok: true}
  end

  def show

  end

  private

  def pet_params
    params.require(:pet).permit(:name, :breed_id, :photos, :family)
  end
end