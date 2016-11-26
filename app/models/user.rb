class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments
  has_many :avatars

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: {case_sensitive: false}, presence: true, format: {
    with:    /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,#REGEXP[:email],
    message: 'should have proper format.'
  }
  validates :password, length: { minimum: 6 }, if: 'password_digest.present?'

end
