class FamilyCare < ListContest
  default_scope { where(type_contest: 'family_care') }

  has_one  :inventory, as: :inventoryable
  has_one  :member_contest, foreign_key: 'list_contest_id'
  has_many :value_format, as: :valueformatable
end