class Profile < ApplicationRecord
  belongs_to :user

  enum type_pmr: [:madya, :wira]
end
