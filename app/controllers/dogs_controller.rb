class DogsController < ApplicationController
  def index
    @dogs = Dog.order(:name).page(params[:page])
  end

  def show
    @dog = Dog.find(params[:id])
  end
    
  def search
    wildcard_search = "%#{params[:keywords]}%"
    @dogs =  Dog.where("name LIKE ?", wildcard_search)
  end
end
