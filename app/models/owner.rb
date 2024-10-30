class Owner < ApplicationRecord
  has_many :dog_owner
  has_many :dog, through :dog_owner

  validates :name, :email, presence: true
end
