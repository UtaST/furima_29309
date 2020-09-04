FactoryBot.define do
  factory :purchase_address do
    token {"aiueo"}
    postal_code {"333-0003"}
    prefecture_id {Faker::Number.within(range: 1..47)}
    city {"テスト市テスト区"}
    house_number {"試験1-1-1"}
    building_name {"テストビル111"}
    tell_number {Faker::Number.number(digits: 11)}
  end
end
