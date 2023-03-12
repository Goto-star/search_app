FactoryBot.define do
  factory :user do
    name { "testuser" }
    email { "test@exmple.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
