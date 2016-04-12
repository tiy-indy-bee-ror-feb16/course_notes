class Authorship < ActiveRecord::Base
  belongs_to :author, counter_cache: :posts_count
  belongs_to :post

  validates :author_id, uniqueness: { scope: :post_id }

end
