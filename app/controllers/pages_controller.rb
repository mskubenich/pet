class PagesController < ApplicationController
  skip_before_filter :authenticate_user
  def index
  end

  def slides
    @copulations = Copulation.all.limit(30).order('id desc').sample(20)
  end

  def sale_slides
    @sales = Sale.all.sample(6)
  end

  def copulation_slides
    @copulations = Copulation.all.sample(3)
  end

  def shop_slides
    @products = Product.popular(10)
  end

  def main_slides
    @slides = MainSlide.all
  end
end
