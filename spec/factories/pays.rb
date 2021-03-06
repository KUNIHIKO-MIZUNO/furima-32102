FactoryBot.define do
  factory :pay do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { 20000 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
