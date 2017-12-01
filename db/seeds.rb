puts "Destroying previous records..."

Reservation.destroy_all
Message.destroy_all
Review.destroy_all
CollectionItem.destroy_all
Book.destroy_all
Profile.destroy_all
User.destroy_all

puts "Creating books..."

20.times do
  Book.create!(title: Faker::Book.title, author: Faker::Book.author, genre: Faker::Book.genre)
end

puts "Creating users and their profile..."

user_count = 0

10.times do
  user_count += 1
  email = "user#{user_count}@gmail.com"
  user = User.create!(email: email , password: "123456")
  Profile.create!(
    user_id: user.id,
    first_name: Faker::Superhero.name,
    last_name: Faker::Superhero.suffix,
    description: Faker::Superhero.descriptor,
    address: Faker::Address.street_address,
    zip_code: Faker::Address.zip_code,
    city: Faker::Address.city,
    country_code: Faker::Address.country_code,
    phone_number: Faker::PhoneNumber.phone_number
  )
end

puts "Creating collection_item with 2 reservations each..."

15.times do
  collection_item = CollectionItem.new(price_per_day: 5)
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
