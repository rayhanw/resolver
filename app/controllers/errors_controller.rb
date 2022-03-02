class ErrorsController < ApplicationController
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

  private

  def error_params
    params.require(:error).permit(:title, :details, :resolver)
  end
end
