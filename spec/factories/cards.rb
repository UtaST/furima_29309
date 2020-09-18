FactoryBot.define do
  factory :card do
    token {"tok_" + Faker::Alphanumeric.alphanumeric(number: 28)}
    customer_token {"cus_" + Faker::Alphanumeric.alphanumeric(number: 28)}

    association :user
  end
end
