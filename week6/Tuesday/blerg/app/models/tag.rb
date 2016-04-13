class Tag < ActiveRecord::Base
  has_many :tagships
  has_many :posts, through: :tagships

  before_validation :cleanse

  validates :name, presence: true, uniqueness: true

  def cleanse
    self.name = CleansedString.new(name).to_s
  end

  def to_param
    name
  end

end
