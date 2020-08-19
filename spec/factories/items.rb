FactoryBot.define do
  factory :item do
    # content {Faker::Lorem.sentence}

    name                    { '商品名' }
    info                    { 'テキスト入力' }
    category_id             { 1 }
    product_status_id       { 1 }
    days_shipping_id        { 1 }
    shipping_region_id      { 1 }
    shipping_charges_id     { 1 }
    price                   { 1000 }
    user               
  end
end
