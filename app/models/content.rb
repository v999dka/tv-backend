class Content < ApplicationController
  validates :title, :original_title, :year, presence: true
end
