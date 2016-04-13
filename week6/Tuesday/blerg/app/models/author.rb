class Author < ActiveRecord::Base
  has_secure_password
  has_many :authorships, dependent: :destroy
  has_many :posts, through: :authorships
  has_many :comments
  has_many :reps, as: :commentable, class_name: 'Comment'
  has_many :commented_on_posts, through: :comments, source: :commentable, source_type: 'Post'

  def update_word_count
    self.word_count = posts.map { |post| post.body.split(" ").length }.inject(:+)
    save!
  end

  def wrote?(post)
    Post.by_author(self).exists?(post.id)
  end

  def commentable
    self
  end

end
