class MyPetsController < ApplicationController

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
      render json: {errors: @pet.errors}
    end
  end

  def update
    attachments_params = params[:copulation][:photos] || []
    if @copulation.update_attributes copulation_params
      update_attachments
      attachments_params.each do |attachment|
        Attachment.create entity_id: @copulation.id, entity_type: Copulation, file: attachment
      end
      @copulation.attachments.where(id: params[:copulation][:removed_photos]).destroy_all
      render json: {ok: true}
    else
      render json: {errors: @copulation.errors}
    end
  end

  def destroy
    MyPet.find(params[:id]).destroy
    render json: {ok: true}
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :breed_id, :photos, :family)
  end
end