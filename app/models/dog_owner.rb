class DogOwner < ApplicationRecord
  belongs_to :dog
  belongs_to :owner
  
  validates :dog_id, presence: true
  validates :owner_id, presence: true
  validates :dog_id, uniqueness: { scope: :owner_id }
end
