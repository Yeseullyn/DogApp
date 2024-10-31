require 'uri'
require 'net/http'
require 'csv'

DogOwner.delete_all
Dog.delete_all
Breed.delete_all
Owner.delete_all

40.times do
  Breed.create(name: Faker::Creature::Dog.breed)
end

def fetch_image_url_for_dog
  url = URI("https://dog.ceo/api/breeds/image/random")
  response = Net::HTTP.get_response(url)
  JSON.parse(response.body)["message"]
end

50.times do
  Dog.create(
    image_url: fetch_image_url_for_dog,
    breed: Breed.all.sample,
    name: Faker::Creature::Dog.name)
end

filename = Rails.root.join("db/people.csv")
csv_data = File.read(filename)
owners = CSV.parse(csv_data, headers: true, encoding: "utf-8")

owners.each do |row|
  owner = Owner.create(name: row['Name'], email: row['Email'])
end

Dog.all.each do |dog|
  selected_owners = Owner.all.sample(rand(1..2))
  selected_owners.each do |owner|
    owner.dogs << dog
  end
end

puts "Created #{Breed.count} breeds"
puts "Created #{Dog.count} image of dogs"
puts "Created #{Owner.count} owners"
puts "Created #{DogOwner.count} dog-owner associations"