class FamilyCare < ListContest
  default_scope { where(type_contest: 'family_care') }

  def generate_code_first_aid
    number_code = self.member_contests.map(&:code).reject(&:blank?)

    case type_pmr
    when 'wira'
      return 'PKW-001' if number_code.blank?
    when 'madya'
      return 'PKM-001' if number_code.blank?
    end

    number_code = number_code.map { |a| a.split('-') }.map(&:last).map(&:to_i).sort.last + 1

    number_code = if number_code < 10
                    "00#{number_code}"
                  elsif number_code >= 10 && number_code <= 99
                    "0#{number_code}"
                  elsif number_code >= 100
                    "#{number_code}"
                  end

    case type_pmr
    when 'madya'
      first_aid_code_madya(number_code)
    when 'wira'
      first_aid_code_wira(number_code)
    end
  end

  def first_aid_code_madya(number)
    "PKM-#{number}"
  end

  def first_aid_code_wira(number)
    "PKW-#{number}"
  end
end