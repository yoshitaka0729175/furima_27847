require 'rails_helper'

RSpec.describe OrderAddresses, type: :model do
  describe '取引情報の保存' do
    @order = FactoryBot.build(:order_addresses)
  end

  before do
    # @ = FactoryBot.build(:item)この記述はconfig/heloerに記述することで省略できる
    @order = build(:order_addresses)
  end

  it '全てvalidatesを通過するのであれば成功' do
    expect(@order).to be_valid
  end

  it '郵便番号が空だとNG' do
    @order.post_cord = nil
    @order.valid?
    expect(@order.errors[:post_cord]).to include('郵便番号を入力してください')
  end

  it '市区町村が空だとNG' do
    @order.city = nil
    @order.valid? # validatesに引っかかるかどうか
    expect(@order.errors[:city]).to include('住所を入力してください')
  end

  it '番地が空だとNG' do
    @order.address = nil
    @order.valid? # validatesに引っかかるかどうか
    expect(@order.errors[:address]).to include('番地を入力してください')
  end

  it '都道府県が空だとNG' do
    @order.shipping_region_id = nil
    @order.valid? # validatesに引っかかるかどうか
    expect(@order.errors[:shipping_region_id]).to include('-は選択できません')
  end

  it '電話番号が空だとNG' do
    @order.phone_number = nil
    @order.valid? # validatesに引っかかるかどうか
    expect(@order.errors[:phone_number]).to include('電話番号を入力してください')
  end
end
