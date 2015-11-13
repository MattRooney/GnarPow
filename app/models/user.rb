class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true

  enum role: %w(default admin)

  has_many :orders
end
