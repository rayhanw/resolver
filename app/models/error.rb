class Error < ApplicationRecord
  include PgSearch::Model

  validates :title, :details, presence: true

  pg_search_scope :search_by_keyword,
                  against: [:title, :resolver],
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
