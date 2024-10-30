require 'uri'
require 'net/http'

Dog.delete_all
Breed.delete_all

200.times do
  Breed.create(name: Faker::Creature::Dog.breed)
end

def fetch_image_url_for_dog
  url = URI("https://dog.ceo/api/breeds/image/random")
  response = Net::HTTP.get_response(url)
  JSON.parse(response.body)["message"]
end

300.times do
  Dog.create(
    image_url: fetch_image_url_for_dog,
    breed: Breed.all.sample)
end

puts "Created #{Breed.count} breeds"
puts "Created #{Dog.count} image of dogs"