class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string   :name,                null: false
      t.text     :info,                null: false
      t.integer  :user_id,             null: false, foreign_key: true
      t.integer  :category_id,         null: false, foreign_key: true
      t.integer  :product_status_id,   null: false, foreign_key: true
      t.integer  :days_shipping_id,    null: false, foreign_key: true
      t.integer  :shipping_region_id,  null: false, foreign_key: true
      t.integer  :shipping_charges_id, null: false, foreign_key: true
      t.integer  :users_id,            null: false, foreign_key: true
      t.integer  :price,               null: false
      t.timestamps
    end
  end
end
