class OrderItem < ActiveRecord::Base
  belongs_to :order
  belons_to :product
end