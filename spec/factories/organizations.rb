FactoryBot.define do
  factory :organization do
    sequence(:name) { |n| "Fake Name#{n}" }
    status { 'submitted' }
    phone { '15555555555' }
    sequence(:email) { |n| "fakeemail#{n}@fake.com" }
    description { 'Fake description.' }
    rejection_reason { nil }
    liability_insurance { true }
    primary_name { 'Fake_primary_name' }
    secondary_name { 'Fake_secondary_name' }
    secondary_phone { '15555555556' }
    title { 'FakeTitle' }
    transportation { 'yes' }

    factory :approved_organization do
      # this will get called after a create as well
      after :build, &:approve
    end
  end
end
