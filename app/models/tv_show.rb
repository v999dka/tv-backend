class TvShow < Content
  has_many :seasons, foreign_key: 'parent_id', dependent: :destroy
end
