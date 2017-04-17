class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :description, :cocktail, :ingredient, presence: true, uniqueness: { scope: :ingredient }
end
