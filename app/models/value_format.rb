class ValueFormat < ApplicationRecord
  belongs_to :member_contest
  belongs_to :list_contest

  serialize :value_format, Hash
end
