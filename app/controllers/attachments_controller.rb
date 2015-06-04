class AttachmentsController < ApplicationController
  load_and_authorize_resource :attachment

  skip_before_filter :verify_authenticity_token

  def create
    params.permit!
    @attachment = Attachment.create file: params[:file], entity_type: params[:entity_type]

    render json: {filelink: @attachment.file.url}
  end
end