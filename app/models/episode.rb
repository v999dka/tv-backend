class Episode < Content
  belongs_to :season, foreign_key: 'parent_id'
end
