class PagesController < ApplicationController
  skip_before_filter :authenticate_user
  def index
  end

  def slides
    @copulations = Copulation.order('id desc').sample(20)
    @copulations = 0.upto(20).map{|i| @copulations[i%@copulations.count] } if @copulations.count > 0
  end

  def sale_slides
    @sales = Sale.all.sample(6)
    @sales = 0.upto(5).map{|i| @sales[i%@sales.count] } if @sales.count > 0
  end

  def copulation_slides
    @copulations = Copulation.all.sample(3)
  end

  def the_copulation_slides
    @slides = CopulationSlide.all
  end

  def shop_slides
    @products = Product.popular(10)
    @products = 0.upto(9).map{|i| @products[i%@products.count] } if @products.count > 0
  end

  def main_slides
    @slides = MainSlide.all
  end
end
