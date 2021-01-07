FactoryBot.define do
  factory :order do
    user_id { 1 }
    item_id { 1 }
    post_code { '111-1111' }
    area_id { 2 }
    city { 'city' }
    street_number { 'street' }
    phone_number { '09011111111' }
    token {'tok_abcdefghijk00000000000000000'}
    end
end