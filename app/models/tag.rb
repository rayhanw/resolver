class Tag < ApplicationRecord
  validates :name, uniqueness: true

  before_validation :capitalize_name

  private

  def capitalize_name
    self.name = name.capitalize
  end
end
