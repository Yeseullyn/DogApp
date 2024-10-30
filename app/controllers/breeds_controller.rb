class BreedsController < ApplicationController
  def index
    @breeds = Breed.order(:name).page(params[:page])
  end

  def show
    @breed = Breed.find(params[:id])
  end
end
