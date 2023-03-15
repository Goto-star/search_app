FactoryBot.define do
  factory :user, class: User do
    name { "testuser" }
    sequence(:email) { |n| "test#{n}@exmple.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :guest_user, class: User do
    name { "ゲスト" }
    email { "guest@example.com" }
  end
end
