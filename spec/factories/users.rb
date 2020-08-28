FactoryBot.define do
  factory :user do
    nickname {Faker::Name.first_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name {"山田"}
    family_name {"太郎"}
    first_name_kana {"ヤマダ"}
    family_name_kana {"タロウ"}
    birthday {Faker::Date.between(from:'1930-01-01', to: '2015-12-31')}
  end
end