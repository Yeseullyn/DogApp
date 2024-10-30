class Dog < ApplicationRecord
  belongs_to :breed
  has_and_belongs_to_many :owners

  validates :image_url, presence: true
  validates :breed, presence: true
end