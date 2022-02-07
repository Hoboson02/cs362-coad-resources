FactoryBot.define do
  factory :region do
        name { 'John Doe' }

        factory :without_name do 
            name { nil }
        end
    end
end