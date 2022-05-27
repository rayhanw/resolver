class ErrorsController < ApplicationController
  before_action :set_error, only: %i[show edit update upvote]

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

  def edit
  end

  def update
    if @error.update(error_params)
      redirect_to error_path(@error)
    else
      render :edit
    end
  end

  def upvote
    @error.upvote!

    if @error.save
      flash[:notice] = "Thank you for your contribution!"
      redirect_to error_path(@error)
    else
      render :show
    end
  end

  private

  def set_error
    @error = Error.find(params[:id])
  end

  def error_params
    params.require(:error).permit(:title, :details, :resolver)
  end
end
