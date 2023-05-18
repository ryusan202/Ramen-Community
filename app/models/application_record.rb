class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def self.primary_class
    self
  end
end
