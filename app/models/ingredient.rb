class Ingredient < ActiveRecord::Base
  belongs_to :measurement_unit
  belongs_to :platillo
  has_many :platillo_ingrediente
  accepts_nested_attributes_for :platillo, allow_destroy: true
  
  validates_presence_of :name, :message => "El nombre no puede estar en blanco" 
  validates_presence_of :stock, :message => "La existencia no puede estar en blanco" 
  validates_numericality_of :stock, :only_integer => true, :message => "El campo existencia debe ser un valor numérico"
  validates_uniqueness_of :name, :message => "Este nombre de ingrediente ya existe, ingresa uno diferente"
  
end
