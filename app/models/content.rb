class Content < ApplicationRecord 
  validates :title, :original_title, :year, presence: true

  has_many :list_contents, dependent: :destroy
  has_many :lists, through: :list_contents

end
