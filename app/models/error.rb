class Error < ApplicationRecord
  has_rich_text :solution

  validates :title, :details, presence: true

  scope :by_most_popular, -> { order(votes: :DESC) }

  def solution_converted
    @solution_converted ||= pipeline.call(solution.to_plain_text)[:output].to_s
  end

  def upvote!
    self.votes += 1
  end
end
