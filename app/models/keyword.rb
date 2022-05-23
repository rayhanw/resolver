class Keyword < ApplicationRecord
  belongs_to :error
  belongs_to :tag

  validates :error, uniqueness: { scope: :tag }
end
