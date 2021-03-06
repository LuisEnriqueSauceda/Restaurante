class Order < ActiveRecord::Base
  belongs_to :table
  belongs_to :customer
  has_many :saucerOrders
  has_many :platillos, through: :saucerOrders
  has_many :users, through: :saucerOrders
  validates :status, :inclusion => {:in => [nil,1,2]}
  validates :takeaway, :inclusion => { :in => [nil,true, false] }
  before_validation  :default_values
  def default_values
    self.status ||= 1
  end
  
  attr_accessor :total,:pedidos
  
  def total
    self.saucerOrders.sum('price*quantity')
  end
  def pedidos
    self.saucerOrders.count
  end
  def mesero 
    return "desconocido" if  self.saucerOrders.count==0 or self.saucerOrders.first.user.nil?
    ac = []
    self.users.uniq.each do |u|
      ac << u.name
    end
    ac.join(", ")
  end
end
