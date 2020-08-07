class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :days_shipping

  # 空の投稿を保存できないようにする
  #--だと登録できないようにする
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
    validates :category_id
    validates :product_status_id
    validates :shipping_charges_id
    validates :shipping_region_id
    validates :days_shipping_id
    validates :price
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  # 300~9.999.999までのあ値を入力できる
end
