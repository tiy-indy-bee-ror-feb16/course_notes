class Truck < ApplicationRecord
  belongs_to :user
  
  validates :name, :food_style, presence: true
end
