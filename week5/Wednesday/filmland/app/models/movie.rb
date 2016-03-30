class Movie < ActiveRecord::Base
  belongs_to :director
  validates :title, :box_office, :director, presence: true

  def box_office_in_dollars
    box_office * 1000000
  end

end
