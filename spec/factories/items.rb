FactoryBot.define do
  factory :item do
    item_name {'あ'}
    explain {'あ'}
    price {1000}
    category_id {2}
    condition_id {2}
    delivery_cost_id {2}
    prefecture_id {2}
    delivery_how_long_id {2}

    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
