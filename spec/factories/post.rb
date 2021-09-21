FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number:10)}
    content { Faker::Lorem.characters(number:100) }
    # tags { Faker::Lorem.characters(number:2) }
    user
  end
end