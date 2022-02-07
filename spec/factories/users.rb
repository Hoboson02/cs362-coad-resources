FactoryBot.define do
  factory :user do
    email { "testemail@mail.com" }
    password { "thisisapassword" }
    role { "admin" }
  end
end