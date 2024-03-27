class ListContent < ApplicationRecord
  belongs_to :list
  belongs_to :content

  default_scope { order(order: :asc) }
end
