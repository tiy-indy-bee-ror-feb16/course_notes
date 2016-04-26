class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :gifs, through: :taggings

  validates :name,
    presence: true

end
