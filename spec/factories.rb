FactoryBot.define do

  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    username { Faker::Name.name }
  end

  factory :todolist do
    name { Faker::Hipster.sentence(3) }
    description { Faker::Hipster.sentence }
    association :user, factory: :user
  end

  factory :trip do
    title { Faker::Book.title }
    description { Faker::Hipster.sentence }
    association :country, factory: :country
    day "Mon"
    time "9:00 PM"
    season { Faker::Hipster.sentence }
  end

  factory :country do
    name "Germany"
  end

  factory :category do
    name { Faker::Book.category }
  end

  factory :listing do
    association :todolist, factory: :todolist
    association :trip, factory: :trip
    association :user, factory: :user
    user_status "Not Started"
    user_season { Faker::Hipster.sentence }
  end
end
