FactoryBot.define do
  factory :ticket do
    name { 'Fake Name' }
    description { 'Fake description.' }
    phone { '15555555555' }
    organization { nil }
    closed { false }
    resource_category
    region

    factory :closed_ticket do
      closed { true }
    end
  end
end
