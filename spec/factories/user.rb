FactoryBot.define do
  factory :user do
    name { "test_user" }
    email { "test@exmple.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :email_blank_user do
    name { "test_user" }
    email { "" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :password_blank_user do
    name { "test_user" }
    email { |n| "test#{n}@exmple.com" }
    password { "" }
    password_confirmation { "password" }
  end
end
