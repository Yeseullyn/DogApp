class DogsController < ApplicationController
  def index
    @dogs = Dog.page params[:page]
  end

  def show
    @dog = Dog.find(params[:id])
  end
end
