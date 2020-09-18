FactoryBot.define do
  factory :item_tag do
    name {Faker::Lorem.word}
    explanation {Faker::Lorem.sentence}
    category_id {Faker::Number.within(range: 1..10)}
    condition_id {Faker::Number.within(range: 1..6)}
    shipping_charge_id {Faker::Number.within(range: 1..2)}
    prefecture_id {Faker::Number.within(range: 1..47)}
    days_until_shipping_id {Faker::Number.within(range: 1..3)}
    price {Faker::Number.within(range: 300..9999999)}
  end
end
