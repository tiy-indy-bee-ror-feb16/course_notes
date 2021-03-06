class Post < ActiveRecord::Base
  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships
  after_save :update_author_word_count
  has_many :comments, as: :commentable
  has_many :tagships
  has_many :tags, through: :tagships

  validates :body, :title, presence: true

  scope :ordered, -> { order("created_at DESC") }
  scope :by_author, -> (author) { joins(:authors).where("authors.id = ?", author.id) }

  paginates_per 5

  def update_author_word_count
    authors.each do |author|
      author.update_word_count
    end
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(tag_string)
    tag_names = tag_string.split(",").map(&:strip)
    tags = tag_names.map do |name|
      Tag.find_or_initialize_by(name: CleansedString.new(name).to_s)
    end
    self.tags = tags
  end

  def commentable
    self
  end

end
