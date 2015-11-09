class User < ActiveRecord::Base
  has_many :ideas

  validates :first_name, :last_name, presence: true


  has_secure_password
  enum role: %w(default admin)

end
