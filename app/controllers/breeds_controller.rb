class BreedsController < ApplicationController
  def index
    @breeds = Breed.order(:name).page(params[:page])
  end

  def show
    @breed = Breed.find(params[:id])
  end
  
  def search
    @breeds = Breed.order(:name)

    if params[:keywords].present?
    wildcard_search = "%#{params[:keywords]}%"
    @breeds = @breeds.where("name LIKE ?", wildcard_search)
    end

    if params[:dog_id].present?
      @breeds = @breeds.where(id: params[:dog_id])
    end
  end
end