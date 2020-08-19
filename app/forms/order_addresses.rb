class OrderAddresses

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_cord, :shipping_region_id, :city, :phone_number, :building_name, :price, :address

  with_options presence: true do
    validates :post_cord, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/, message: "郵便番号を入力してください"}
    validates :city, presence: {message: "住所を入力してください"}
    validates :address, presence: {message: "番地を入力してください"}
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/, message: "電話番号を入力してください"}
    validates :shipping_region_id, presence: {message: "都道府県を選択してください"}
  end

  validates :shipping_region_id, numericality: { other_than: 0, message: "-は選択できません" }

  def save
    Addresses.create(post_cord: post_cord, shipping_region_id: shipping_region_id, city: city, phone_number: phone_number, building_name: building_name, address: address, item_id: item_id)
    Order.create(user_id: user_id, item_id: item_id)
  end

end