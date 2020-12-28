FactoryBot.define do
  factory :item do
    image { fixture_file_upload('app/assets/images/item-sample.png') }
    name { Faker::title }
    description { Faker::sentence }
    category_id { 2 }
    state_id { 2 }
    cost_id { 2 }
    area_id { 2 }
    day_id { 2 }
    price { Faker::numberBetween(min = 300, max = 9999999) }

  end
end
