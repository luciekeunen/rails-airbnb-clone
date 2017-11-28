20.times do
  Book.create!(title: Faker::Book.title, author: Faker::Book.author, genre: Faker::Book.genre)
end

10.times do
  user = User.create!(email: Faker::Internet.email, password: "123456")
  Profile.create!(user_id: user.id, first_name: Faker::Superhero.name, last_name: Faker::Superhero.suffix, description: Faker::Superhero.descriptor)
end

20.times do
  collection_item = CollectionItem.new(price_per_day: 50)
  collection_item.book_id = (1..20).to_a.sample
  collection_item.profile_id = (1..10).to_a.sample
  collection_item.save!
end
