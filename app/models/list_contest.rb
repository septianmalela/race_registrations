class ListContest < ApplicationRecord
  enum type_pmr: [:madya, :wira]
  enum type_contest: [
                      :first_aid, :family_care, :stretcher,
                      :asincan, :doras, :rsps, :leadership,
                      :history
                    ]

  validates :type_pmr, uniqueness: { scope: :type_contest,
    message: "can't double type PMR & type contest" }

  class << self
    def title_names
      {
        first_aid: 'Pertolongan Pertama', family_care: 'Perawatan Keluarga',
        stretcher: 'Tandu Darurat', asincan: 'Ayo Siaga Bencana',
        doras: 'Donor Darah Sukarela', rsps: 'Remaja Sehat Peduli Sesama',
        leadership: 'Kepemimpinan', history: 'Gerakan'
      }
    end
  end
end
