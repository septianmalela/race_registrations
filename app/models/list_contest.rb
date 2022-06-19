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

  validates :type_pmr, uniqueness: { scope: :type_contest,
    message: "can't double type PMR & type contest" }

  serialize :value_format, Hash

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

  def get_code
    case type_contest
    when 'first_aid'
      get_code_first_aid
    when 'family_care'
      get_code_family_care
    when 'stretcher'
      get_code_stretcher
    when 'asincan'
      get_code_asincan
    when 'doras'
      get_code_doras
    when 'rsps'
      get_code_rsps
    when 'leadership'
      get_code_leadership
    when 'history'
      get_code_history
    end
  end

  def get_code_first_aid
    first_aid = FirstAid.find(id)
    first_aid.generate_code_first_aid
  end

  def get_code_family_care
    family_care = FamilyCare.find(id)
    family_care.generate_code_first_aid
  end

  def get_code_stretcher
    stretcher = Stretcher.find(id)
    stretcher.generate_code_first_aid
  end

  def get_code_asincan
    asincan = Asincan.find(id)
    asincan.generate_code_first_aid
  end

  def get_code_doras
    doras = Doras.find(id)
    doras.generate_code_first_aid
  end

  def get_code_rsps
    rsps = Rsps.find(id)
    rsps.generate_code_first_aid
  end

  def get_code_leadership
    leadership = Leadership.find(id)
    leadership.generate_code_first_aid
  end

  def get_code_history
    history = History.find(id)
    history.generate_code_first_aid
  end
end
