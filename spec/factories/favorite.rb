FactoryBot.define do
  factory :favorite, class: Favorite do
    user
    post
  end
end
