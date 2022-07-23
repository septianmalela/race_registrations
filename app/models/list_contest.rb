class ListContest < ApplicationRecord
  enum type_pmr: [:madya, :wira]
  enum type_contest: [
                      :first_aid, :family_care, :stretcher,
                      :asincan, :doras, :rsps, :leadership,
                      :history
                    ]

  has_one  :inventory, as: :inventoryable
  has_many :member_contests
  has_many :value_formats

  before_destroy :check_member_contests

  serialize :value_format, Hash

  scope :get_list_contests, ->(type_pmr) { where(type_pmr: type_pmr) }

  accepts_nested_attributes_for :inventory

  def check_member_contests
    return if member_contests.blank?

    self.errors.add(:base, "Mata lomba tidak bisa dihapus karena ada peserta yang daftar!")
    throw(:abort)
  end

  class << self
    def title_names
      {
        first_aid: 'Pertolongan Pertama', family_care: 'Perawatan Keluarga',
        stretcher: 'Tandu Darurat', asincan: 'Ayo Siaga Bencana',
        doras: 'Donor Darah Sukarela', rsps: 'Remaja Sehat Peduli Sesama',
        leadership: 'Kepemimpinan', history: 'Gerakan'
      }
    end

    def get_member_contest(type_pmr)
      get_list_contests = get_list_contests(type_pmr)
      hash_member_contests = {}

      get_list_contests.each do |list_contest|
        type_contest = list_contest.type_contest
        hash_member_contests[type_contest.to_sym] = list_contest.member_contests.count
      end

      hash_member_contests
    end
  end
end
