class Dog < ApplicationRecord
  belongs_to :breed
  
  has_many :dog_owner
  has_many :owner, through :dog_owner

  validates :image_url, presence: true
  validates :breed, presence: true
end