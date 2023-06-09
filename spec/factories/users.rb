FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password { "a1" + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    family_name { person.first.kanji }
    last_name { person.last.kanji }
    family_kana { person.first.katakana }
    last_kana { person.last.katakana }
    birthday {Faker::Date.between(from: '2023-01-01', to: '2023-06-30')}
  end
end