class DogsController < ApplicationController
  def index
    @dogs = Dog.joins(:breed).order("breeds.name").page params[:page]
  end

  def show
    @dog = Dog.find(params[:id])
  end
    
  def search
    wildcard_search = "%#{params[:keywords]}%"
    @dogs =  Dog.joins(:breed).where("breeds.name LIKE ?", wildcard_search)
  end
end
