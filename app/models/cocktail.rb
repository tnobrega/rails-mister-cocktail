class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :doses, dependent: :destroy
  has_many :ingredients , through: :doses

  def unused_ingredients
    Ingredient.where.not(id: ingredients)
  end

end
