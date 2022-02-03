FactoryBot.define do
  factory :organization do
    name { "Fake Name" }
    status { 'submitted' }
    phone { "15555555555" }
    email { "fakeemail@fake.com" }
    description { "Fake description." }
    rejection_reason { nil }
    liability_insurance { true }
    primary_name { "Fake_primary_name" }
    secondary_name { "Fake_secondary_name" }
    secondary_phone { "15555555556" }
    title { "FakeTitle" }
    transportation { 'yes' }
  end
end