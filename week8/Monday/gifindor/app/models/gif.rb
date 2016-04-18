class Gif < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  validates :user, :image_url, presence: true

  paginates_per 24
  default_scope { order(created_at: :desc) }

  def tag_with(string)
    self.tag_names = string.split(",").map(&:strip)
  end

  def tag_names=(tags)
    if tags.is_a? String
      tag_with(tags)
    else
      self.tags = tags.map{ |t| self.class.make_tag(t) }.compact
    end
  end

  def self.make_tag(tag_name)
    Tag.find_or_create_by(name: tag_name)
  end

  def tag_names
    tags.map(&:name).join(", ")
  end

end
