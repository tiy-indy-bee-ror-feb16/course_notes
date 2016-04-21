class User < ApplicationRecord
  has_many :trucks
  has_secure_password
  
  after_validation :generate_access_token, on: [:create]

  def generate_access_token
    self.access_token = SecureRandom.hex(20)
  end
end
