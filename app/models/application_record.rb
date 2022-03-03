class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def pipeline
    @pipeline ||= HTML::Pipeline.new([
                    HTML::Pipeline::MarkdownFilter
                  ])
  end
end
