class PagesController < ApplicationController
  skip_before_filter :authenticate_user
  def index
  end

  def slides
    @attachments = Attachment.where(entity_type: Copulation).sample(20)
  end

  def sale_slides
    @sales = Sale.all.sample(6)
  end

  def shop_slides

  end

  def news
    @news = News.all.sample(2)
  end
end
