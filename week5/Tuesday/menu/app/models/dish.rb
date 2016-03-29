class Dish < ActiveRecord::Base

  has_many :ingredients

  validates :name, :price, presence: true

  validates :price, :cost, numericality: true

  def picky_eater?
    vegetarian? && gluten_free?
  end

  def price
    if Time.now.wday == 2
      self[:price] - 200
    else
      self[:price]
    end
  end

  def margin
    price - cost
  end

end
