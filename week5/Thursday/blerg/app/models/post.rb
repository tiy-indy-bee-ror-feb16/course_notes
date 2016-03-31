class Post < ActiveRecord::Base
  belongs_to :author, counter_cache: true
  after_save :update_author_word_count

  def update_author_word_count
    author.update_word_count
  end
end
