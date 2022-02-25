class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def pipeline
    @pipeline ||= HTML::Pipeline.new([
                    HTML::Pipeline::MarkdownFilter
                  ])
  end

  class << self
    def random(n = 5)
      limit(n).order("RANDOM()")
    end
  end
end
