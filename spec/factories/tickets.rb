FactoryBot.define do
  factory :ticket do
    name { "Fake Name" }
    description { "Fake description." }
    phone { "15555555555" }
    organization { nil }
    closed { false }
    resource_category { nil }
    region { nil }

    factory :closed_ticket do
      closed { true }
    end
  end
end