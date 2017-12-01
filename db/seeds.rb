puts "Destroying previous records..."

Reservation.destroy_all
Message.destroy_all
Review.destroy_all
CollectionItem.destroy_all
Book.destroy_all
Profile.destroy_all
User.destroy_all

puts "Creating books..."

PHOTO = ["book1","book2","book3","book4","book5","book6","book7","book8","book9","book10","book11"]

20.times do
  Book.create!(title: Faker::Book.title, author: Faker::Book.author, genre: Faker::Book.genre, photo: PHOTO.sample, synopsis: "Once upon a time, there was a little man named Clement. He was not very smart, and he was not very tall neither. You might think he was a little stupid too. Guess what ? You're right.")
end

puts "Creating users and their profile..."

# user_count = 0

# 10.times do
#   user_count += 1
#   email = "user#{user_count}@gmail.com"
#   user = User.create!(email: email , password: "123456")
#   Profile.create!(
#     user_id: user.id,
#     first_name: Faker::Superhero.name,
#     last_name: Faker::Superhero.suffix,
#     description: Faker::Superhero.descriptor,
#     address: Faker::Address.street_address,
#     zip_code: Faker::Address.zip_code,
#     city: Faker::Address.city,
#     country_code: Faker::Address.country_code,
#     phone_number: Faker::PhoneNumber.phone_number
#   )
# end


puts "With real addresses..."

puts "1"
  email = "user1@gmail.com"
  user = User.create!(email: email , password: "123456")
  Profile.create!(
    user_id: user.id,
    first_name: Faker::Superhero.name,
    last_name: Faker::Superhero.suffix,
    description: Faker::Superhero.descriptor,
    address: "Rue de Rivoli",
    # zip_code: Faker::Address.zip_code,
    city: "Paris",
    # country_code: Faker::Address.country_code,
    phone_number: Faker::PhoneNumber.phone_number
  )


puts "2"
  email = "user2@gmail.com"
  user = User.create!(email: email , password: "123456")
  Profile.create!(
    user_id: user.id,
    first_name: Faker::Superhero.name,
    last_name: Faker::Superhero.suffix,
    description: Faker::Superhero.descriptor,
    address: "Rue Nationale",
    # zip_code: Faker::Address.zip_code,
    city: "Lille",
    # country_code: Faker::Address.country_code,
    phone_number: Faker::PhoneNumber.phone_number
  )


puts "3"
  email = "user3@gmail.com"
  user = User.create!(email: email , password: "123456")
  Profile.create!(
    user_id: user.id,
    first_name: Faker::Superhero.name,
    last_name: Faker::Superhero.suffix,
    description: Faker::Superhero.descriptor,
    address: "Rue Solférino",
    # zip_code: Faker::Address.zip_code,
    city: "Lille",
    # country_code: Faker::Address.country_code,
    phone_number: Faker::PhoneNumber.phone_number
  )


puts "4"
  email = "user4@gmail.com"
  user = User.create!(email: email , password: "123456")
  Profile.create!(
    user_id: user.id,
    first_name: Faker::Superhero.name,
    last_name: Faker::Superhero.suffix,
    description: Faker::Superhero.descriptor,
    address: "Rue Léon Gambetta",
    # zip_code: Faker::Address.zip_code,
    city: "Lille",
    # country_code: Faker::Address.country_code,
    phone_number: Faker::PhoneNumber.phone_number
  )


puts "5"
  email = "user5@gmail.com"
  user = User.create!(email: email , password: "123456")
  Profile.create!(
    user_id: user.id,
    first_name: Faker::Superhero.name,
    last_name: Faker::Superhero.suffix,
    description: Faker::Superhero.descriptor,
    address: "Rue Esquermoise",
    zip_code: 59800,
    city: "Lille",
    # country_code: Faker::Address.country_code,
    phone_number: Faker::PhoneNumber.phone_number
  )


puts "Creating collection_item with 2 reservations each..."

15.times do
  collection_item = CollectionItem.new(price_per_day: rand(0..30))
  collection_item.book = Book.all.sample
  collection_item.profile = Profile.all.sample
  collection_item.save!

  2.times do
    reservation = Reservation.new(status: "pending", start_day: Date.today, end_day: Date.tomorrow, final_price: 5)
    reservation.profile = Profile.all.sample
    reservation.collection_item = collection_item
    reservation.save!
  end
end

puts "Seeds completed! :)"
