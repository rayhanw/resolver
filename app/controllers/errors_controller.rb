class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  before_action :is_admin!, only: %i[new create]

  def show
    @error = Error.find(params[:id])
  end

  def new
    @error = Error.new
  end

  def create
    @error = Error.new(error_params)

    if @error.save
      redirect_to error_path(@error)
    else
      render :new
    end
  end

  def upvote
    @error = Error.find(params[:id])
    @error.upvote!

    if @error.save
      flash[:notice] = "Thank you for your contribution!"
      redirect_to error_path(@error)
    else
      render :show
    end
  end

  private

  def error_params
    params.require(:error).permit(:title, :details, :resolver)
  end
end
