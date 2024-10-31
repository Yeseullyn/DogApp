class Owner < ApplicationRecord
  has_many :dog_owners
  has_many :dogs, through: :dog_owners

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
