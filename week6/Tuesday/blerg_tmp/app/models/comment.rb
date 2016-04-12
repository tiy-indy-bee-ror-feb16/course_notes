class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :author
  has_many :comments, as: :commentable

  validates :body, :author, presence: true


  def on?(object)
    commentable == object
  end

end
