class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items

  def total_price
    order_items.map{|i| i.count.to_i * i.price.to_i }.sum
  end
end