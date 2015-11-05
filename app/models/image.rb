class Image < ActiveRecord::Base
  has_many :ideas, through: :idea_image
end
