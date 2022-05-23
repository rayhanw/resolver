class Error < ApplicationRecord
  include PgSearch::Model

  has_many :keywords
  has_many :tags, through: :keywords

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

  def solution_converted
    @solution_converted ||= pipeline.call(solution.to_plain_text)[:output].to_s
  end

  def upvote!
    self.votes += 1
  end
end
