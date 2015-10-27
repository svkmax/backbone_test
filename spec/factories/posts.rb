FactoryGirl.define do
  factory :post do
    name { Faker::Name.name }
    title { Faker::Book.title }
    message { Faker::Lorem.sentence(20) }
  end
end