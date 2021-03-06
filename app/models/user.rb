class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_one :contest, dependent: :destroy

  validates :email, uniqueness: true

  accepts_nested_attributes_for :profile, reject_if: :all_blank
end
