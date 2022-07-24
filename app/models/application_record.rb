class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def default_url
    Rails.env.eql?('development') ? 'http://localhost:3000' : ''
  end
end
