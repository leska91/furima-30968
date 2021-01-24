FactoryBot.define do
  factory :purchase_shippinginfo do
    postal_code { '111-1111' }
    prefecture_id { 6 }
    city { "千葉市" }
    address { "1-1-1" }
    building { "" }
    phone_number { '09011111111' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
