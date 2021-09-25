FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Lorem.characters(number: 10) }
    introduction { Faker::Lorem.characters(number: 20) }
    password { 'password' }
    password_confirmation { 'password' }
    
    after(:create) do |user|
      create_list(:chat, 1, user: user, room: create(:room))
      create_list(:user_room, 1, user: user, room: create(:room))
    end
  end
end
