class FirstAid < ListContest
  default_scope { where(type_contest: 'first_aid') }

  has_one  :inventory, as: :inventoryable
  has_one  :member_contest, foreign_key: 'list_contest_id'
  has_many :value_format, as: :valueformatable
end