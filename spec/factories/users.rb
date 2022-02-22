FactoryBot.define do
  factory :user do
    email { "testemail@mail.com" }
    password { "thisisapassword" }
    role { "admin" }
    
    after :create, &:confirm

    factory :organization_user do
      role { "organization" }
    end
  end
end