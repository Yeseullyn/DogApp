Dog.delete_all
Breed.delete_all

50.times do
  Breed.create(name: Faker::Creature::Dog.breed)
end

200.times do
  Dog.create(
    image_url: "https://dog.ceo/api/breeds/image/random",
    breed: Breed.all.sample)
end

puts "Created #{Breed.count} Breeds"
puts "Created #{Dog.count} image of dogs"