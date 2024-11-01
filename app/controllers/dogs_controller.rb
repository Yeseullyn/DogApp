class DogsController < ApplicationController
  def index
    @dogs = Dog.order(:name).page(params[:page])
  end

  def show
    @dog = Dog.find(params[:id])
    @dogs = Dog.where(name: @dog.name)
  end
    
  def search
    @dogs = Dog.order(:name)

    if params[:keywords].present?
    wildcard_search = "%#{params[:keywords]}%"
    @dogs =  @dogs.where("dogs.name LIKE ?", wildcard_search)
    end
    if params[:breed_id].present?
      @dogs = @dogs.where(breed_id: params[:breed_id])
    end
  end
end