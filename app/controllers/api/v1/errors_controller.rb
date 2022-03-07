class Api::V1::ErrorsController < Api::V1::BaseController
  def index
    @errors = Error.by_most_popular
    @content = '[
  &nbsp;&nbsp;{
    &nbsp;&nbsp;&nbsp;&nbsp;"id": 1,
    &nbsp;&nbsp;&nbsp;&nbsp;"title": "undefined method nil:NilClass",
    &nbsp;&nbsp;&nbsp;&nbsp;"details": "Happens on ...",
    &nbsp;&nbsp;&nbsp;&nbsp;"resolver": "Solution goes here"
  &nbsp;&nbsp;},
  &nbsp;&nbsp;{
    &nbsp;&nbsp;&nbsp;&nbsp;"id": 2,
    &nbsp;&nbsp;&nbsp;&nbsp;"title": "Heroku ...",
    &nbsp;&nbsp;&nbsp;&nbsp;"details": "Happens on ...",
    &nbsp;&nbsp;&nbsp;&nbsp;"resolver": "Solution goes here"
  &nbsp;&nbsp;}
]'
  end

  def show
    @error = Error.find(params[:id])
  end

  def show_api
  end
end
