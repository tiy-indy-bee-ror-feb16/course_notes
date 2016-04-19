class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :gif

  validates :tag, :gif, presence: true
end
