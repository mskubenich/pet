class ShopCategoriesController < ApplicationController

  skip_before_filter :authenticate_user

  def index
    @shop_categories = ShopCategory.all
  end
end