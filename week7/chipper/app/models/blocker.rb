class Blocker < ActiveRecord::Base
  belongs_to :blocker, class_name: 'User'
  belongs_to :blocked, class_name: 'User'

  after_save :force_unfollow

  def force_unfollow
    blocker.unfollow(blocked)
  end
end
