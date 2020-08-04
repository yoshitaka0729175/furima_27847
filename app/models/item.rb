class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :catogory, :product_status, :shipping_charges

    #空の投稿を保存できないようにする
    #--だと登録できないようにする
    with_options :name, presence:, numbericality: { other_than: 1} do
      validates :category_id
      validates :product_status 
      validates :shipping_charges
      validates
    end
end
