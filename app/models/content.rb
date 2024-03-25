class Content < ApplicationRecord 
  validates :title, :original_title, :year, presence: true
end
