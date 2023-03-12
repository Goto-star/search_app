users = User.order(:created_at).take(1)
50.times do |n|
  title = Faker::Lorem.sentence(word_count: 2)
  place = "〇〇病院"
  impression = Faker::Lorem.sentence(word_count: 11)
  users.each { |user| user.posts.create!(title: title, place: place, impression: impression) }
end
