FactoryBot.define do
  factory :order do
    order_status { "Pending" }
    order_code { Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 3, min_numeric: 3) }
    order_name { Faker::Name.name }
    order_app { "Uber Eats" }
  end
end
