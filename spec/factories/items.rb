FactoryBot.define do
  factory :item do
    name                    { 'おいしいオムライス' }
    information             { 'おいしいオムライスです' }
    category_id             { 3 }
    sales_status_id         { 3 }
    shipping_fee_status_id  { 2 }
    prefecture_id           { 6 }
    scheduled_delivery_id   { 3 }
    sell_price              { 40_000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
