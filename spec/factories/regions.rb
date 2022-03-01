FactoryBot.define do
  factory :region do
    sequence(:name) { |n| "John Doe#{n}" }

    factory :without_name do
      name { nil }
    end
  end
end
