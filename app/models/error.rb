class Error < ApplicationRecord
  has_rich_text :solution

  validates :title, :details, presence: true
end
