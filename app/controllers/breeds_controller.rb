class BreedsController < ApplicationController
  def index
    @breeds = Breed.order(:name).page(params[:page])
  end

  def show
    @breed = Breed.find(params[:id])
  end
  
  def search
    wildcard_search = "%#{params[:keywords]}%"
    @breeds = Breed.where("name LIKE ?", wildcard_search)
  end
end
