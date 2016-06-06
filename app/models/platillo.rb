class Platillo < ActiveRecord::Base
  belongs_to :category
  has_many :saucerOrders
  has_many :orders, through: :saucerOrder
end
