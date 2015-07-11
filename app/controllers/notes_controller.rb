class NotesController < ApplicationController

  def create
    @note = Note.new notes_params
    @note.user_id = current_user.id
    @entity = @note.ratingable

    if @note.save
      render template: 'notes/show'
    else
      render json: {errors: @note.errors}, status: :unprocessable_entity
    end
  end

  def show
    @entity = params[:entity_type].constantize.find params[:id]
  end

  private

  def notes_params
    params.require(:note).permit(:points, :entity_id, :entity_type)
  end
end