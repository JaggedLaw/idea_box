class User < ActiveRecord::Base
  has_many :ideas
  validates :first_name, :last_name, presence: true
end
