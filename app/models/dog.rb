class Dog < ApplicationRecord
  belongs_to :breed
  
  has_many :dog_owners
  has_many :owners, through: :dog_owners

  validates :image_url, presence: true
  validates :breed, presence: true
end