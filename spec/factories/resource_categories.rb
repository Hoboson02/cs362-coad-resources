FactoryBot.define do
  factory :resource_category do
    name { "Fake Resource Category" }
    active { true }

    factory :inactive_resource_category do
      active { false }
    end
  end
end