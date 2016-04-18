class User < ActiveRecord::Base
  has_secure_password
  has_many :gifs

  validates :email,
    presence: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  validates :username,
    presence: true,
    format: { with: %r(\A\w+\z) }

  scope :find_for_login, -> (identifier) { where('users.username = ? OR users.email =?', identifier, identifier).first }

end
