class PagesController < ApplicationController
  skip_before_filter :authenticate_user
  def index
  end

  def slides
    @attachments = Attachment.where(entity_type: Copulation).limit(20)
  end
end
