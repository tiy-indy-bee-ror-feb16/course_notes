class Author < ActiveRecord::Base
  has_many :posts

  def update_word_count
    self.word_count = posts.map { |post| post.body.split(" ").length }.inject(:+)
    save!
  end

end
