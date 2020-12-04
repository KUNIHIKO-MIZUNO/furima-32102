FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday              { Faker::Date.birthday }
    last_name             { Gimei.unique.last }
    first_name            { Gimei.unique.first }
    last_name_kana        { Gimei.last.katakana }
    first_name_kana       { Gimei.first.katakana }
  end
end
