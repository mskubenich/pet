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

  def copulation_slides
    @copulations = Copulation.all.sample(3)
  end

  def shop_slides

  end

  def main_slides
    @slides = MainSlide.all
  end

  def news
    @news = News.all.order('RAND()').limit(2)
  end
end
