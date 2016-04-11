class User < ActiveRecord::Base
  include PgSearch

  has_secure_password
  has_many :cheeps
  has_many :followerings, foreign_key: :followed_id, class_name: 'Follow'
  has_many :followedings, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followers, through: :followerings
  has_many :followeds, through: :followedings
  has_many :blockerings, foreign_key: :blocker_id, class_name: 'Blocker'
  has_many :blockedings, foreign_key: :blocked_id, class_name: 'Blocker'
  has_many :blockers, through: :blockedings
  has_many :blocked, through: :blockerings

  pg_search_scope :search_by_username, :against => :username

  scope :find_for_login, -> (identifier) { where('users.username = ? OR users.email =?', identifier, identifier).first }

  def to_param
    username
  end

  def profile_photo
    image_url || Gravatar.new(email).image_url
  end

  def follow(user)
    followeds << user unless follows?(user) || blocked_by?(user)
  end

  def unfollow(user)
    followedings.find_by(followed: user).destroy unless doesnt_follow?(user)
  end

  def toggle_follow(user)
    follows?(user) ? unfollow(user) : follow(user)
  end

  def follows?(user)
    followedings.exists?(followed: user)
  end

  def doesnt_follow?(user)
    !follows?(user)
  end

  def blocked_by?(user)
    blockedings.exists?(blocker: user)
  end

  def block!(user)
    self.blocked << user
  end

  def unblock!(user)
    blockerings.where(blocked: user).destroy_all
  end

  def toggle_block(user)
    user.blocked_by?(self) ? unblock!(user) : block!(user)
  end

  def followable_by?(user)
    !(user == self) && !user.follows?(self) && !user.blocked_by?(self)
  end

  def timeline
    Cheep.timeline(self)
  end
end
