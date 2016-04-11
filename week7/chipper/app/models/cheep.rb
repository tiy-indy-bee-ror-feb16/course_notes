class Cheep < ActiveRecord::Base
  include PgSearch

  belongs_to :user
  validates :body, length: { maximum: 170 }
  has_many :carrotings
  has_many :carrots, through: :carrotings

  default_scope { order(created_at: :desc) }
  pg_search_scope :search_by_body, :against => :body

  after_save :save_carrots

  def self.timeline(user)
    ids = user.followeds.pluck(:id) << user.id
    where(user_id: ids)
  end

  def detect_carrots
    body.scan(/(\^\S+)/).flatten
  end

  def save_carrots
    detect_carrots.each do |carrot_name|
      carrots << Carrot.find_or_initialize_by(name: carrot_name)
    end
  end
end
