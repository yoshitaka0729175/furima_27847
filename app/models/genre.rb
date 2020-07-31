class Genre < ApplicationRecord
  self.data = [
    { id: 1, category: 'カテゴリー'},
    { id: 2, product_status: '商品の状態'},
    { id: 3, days_shipping: '発送までの日数'},
    { id: 4, shipping_region: '発送元地域'},
    { id: 5, shipping_charges: '配送料の負担'},
    { id: 6, prefectures: '都道府県'},
  ]
end
