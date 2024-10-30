class Owner < ApplicationRecord
  has_and_belong_to_many :dogs

  validates :name, :email, presence: true
end
