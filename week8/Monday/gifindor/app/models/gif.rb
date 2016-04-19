class Gif < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  attachment :gif

  validates :user, presence: true
  validate :has_at_least_one_image

  paginates_per 24
  default_scope { order(created_at: :desc) }

  # Validator for image_url or gif
  def has_at_least_one_image
    if [image_url, gif].count(&:blank?) == 2
      errors[:base] << "You kinda need an image"
    end
  end

  def has_upload?
    !gif.blank?
  end

  def gif_display_url
    if has_upload?
      Refile.attachment_url(self, :gif)
    else
      image_url
    end
  end

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
