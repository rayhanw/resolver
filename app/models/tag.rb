class Tag < ApplicationRecord
  NAMES = %w[Rails ActiveStorage Javascript CSS Heroku VSCode]

  validates :name, uniqueness: true

  has_many :keywords
  has_many :resolvers, through: :keywords, source: :error

  before_validation :capitalize_name

  private

  def capitalize_name
    self.name = name.capitalize
  end
end
