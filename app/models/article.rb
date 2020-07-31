class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  validates :category, :product_status, :days_shipping, :shipping_region, :shipping_charges, :prefectures, :genre. presence: true

  with_options numbericality: { other_than: 1} do
    validates :genre_id
  end
end
