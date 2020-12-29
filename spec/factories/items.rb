FactoryBot.define do
  factory :item do
    name { '商品名' }
    description { '商品説明' }
    category_id { 2 }
    state_id { 2 }
    cost_id { 2 }
    area_id { 2 }
    day_id { 2 }
    price { 500 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.jpg'), filename: 'sample.jpg')
    end
  end
end
