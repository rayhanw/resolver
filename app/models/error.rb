class Error < ApplicationRecord
  include PgSearch::Model

  has_many :keywords
  has_many :tags, through: :keywords

  enum :status, { pending: 0, accepted: 1, rejected: 2 }

  validates :title, :details, presence: true

  pg_search_scope :search_by_keyword,
                  against: [
                    [:title, "A"],
                    [:resolver, "B"]
                  ],
                  associated_against: {
                    tags: :name
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
  scope :by_most_popular, -> { order(votes: :DESC) }
  scope :with_tags, -> { includes(:tags) }

  def upvote!
    self.votes += 1
  end
end
