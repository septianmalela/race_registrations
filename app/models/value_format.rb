class ValueFormat < ApplicationRecord
  belongs_to :member_contest
  belongs_to :valueformatable, polymorphic: true

  serialize :value_format, Hash
end
