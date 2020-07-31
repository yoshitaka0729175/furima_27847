class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string  :category          ,null: false
      t.string  :product_status    ,null: false
      t.string  :days_shipping     ,null: false
      t.string  :shipping_region   ,null: false
      t.string  :shipping_charges  ,null: false
      t.string  :prefectures       ,null: false
      t.integer :genre_id          ,null: false
      t.timestamps
    end
  end
end
