class Dog < ApplicationRecord
  belongs_to :breed

  validates :image_url, presence: true
  validates :breed, presence: true
end