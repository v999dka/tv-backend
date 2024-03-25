class Season < Content
  belongs_to :tv_show, foreign_key: 'parent_id'
  has_many :episodes, foreign_key: 'parent_id', dependent: :destroy
end
