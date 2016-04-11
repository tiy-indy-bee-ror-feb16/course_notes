class Carrot < ActiveRecord::Base
  has_many :carrotings
  has_many :cheeps, through: :carrotings

  def to_param
    name.gsub(/\^/, "")
  end
end
