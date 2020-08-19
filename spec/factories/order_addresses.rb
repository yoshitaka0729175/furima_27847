FactoryBot.define do
  factory :order_addresses do
    post_cord     {'123-4567'}
    city          { '市区町村' }
    address       { '番地' }
    shipping_region_id { 1 }
    phone_number  { '09099999999' }
    building_name { '東京ハイツ' }
    price         { 2000 }
  end
end