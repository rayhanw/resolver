class Api::V1::ErrorsController < Api::V1::BaseController
  def index
    @errors = Error.by_most_popular
    @content = '[
  &emsp;{
    &emsp;&emsp;"id": 1,
    &emsp;&emsp;"title": "undefined method nil:NilClass",
    &emsp;&emsp;"details": "Happens on ...",
    &emsp;&emsp;"resolver": "Solution goes here"
  &emsp;},
  &emsp;{
    &emsp;&emsp;"id": 2,
    &emsp;&emsp;"title": "Heroku ...",
    &emsp;&emsp;"details": "Happens on ...",
    &emsp;&emsp;"resolver": "Solution goes here"
  &emsp;}
]'
  end

  def show
    @error = Error.find(params[:id])
  end

  def show_api
    @content = '{
      &emsp;"id": 1,
      &emsp;"title": "Heroku ...",
      &emsp;"details": "Happens on ...",
      &emsp;"resolver": "Solution goes here"
    }'
  end
end
