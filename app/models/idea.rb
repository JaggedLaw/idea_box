class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :images, through: :idea_image
  validates :name, :description, presence: true
end
