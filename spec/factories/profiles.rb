FactoryBot.define do
  factory :profile do
    first_name {"山田"}
    family_name {"太郎"}
    first_name_kana {"ヤマダ"}
    family_name_kana {"タロウ"}
    birthday {Faker::Date.between(from:'1930-01-01', to: '2015-12-31')}

    association :user
  end
end
