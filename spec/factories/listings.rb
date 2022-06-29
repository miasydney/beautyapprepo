FactoryBot.define do
  factory :listing do
    title { "MyString" }
    description { nil }
    price { 1 }
    business { "MyString" }
    instagram { "MyString" }
    booked { false }
    date { "2022-06-29" }
    time { "2022-06-29 14:09:15" }
    user { nil }
    category { nil }
    city { nil }
  end
end
