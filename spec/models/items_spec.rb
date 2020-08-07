require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do # 今から確認するアクションに関連することを書く
    before do
      # @item = FactoryBot.build(:item)この記述はconfig/heloerに記述することで省略できる
      @item = build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    # it "is valid with a name, images, info, product_status_id, category_id, days_shipping_id, shipping_region_id, shipping_charges_id, price" do
    #   # item = build(:item)
    #   expect(@item).to be_valid
    # end

    it '全てvalidatesを通過するのであれば成功' do
      expect(@item).to be_valid
    end

    it 'imageが空だとNG' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Imageを入力してください')
    end

    it '商品名空だとNG' do
      @item.name = nil
      @item.valid? # validatesに引っかかるかどうか
      expect(@item.errors[:name]).to include('を入力してください')
    end

    it '商品名41文字以上だとNG' do
      @item.name = 'あ' * 41
      @item.valid? # validatesに引っかかるかどうか
      expect(@item.errors[:name]).to include('は40文字以内で入力してください')
    end

    it 'テキストが空だとNG' do
      @item.info = nil
      @item.valid? # validatesに引っかかるかどうか
      expect(@item.errors[:info]).to include('を入力してください')
    end

    it 'テキストが1001文字だとNG' do
      @item.info = 'あ' * 1001
      @item.valid? # validatesに引っかかるかどうか
      expect(@item.errors[:info]).to include('は1000文字以内で入力してください')
    end

    it 'カテゴリーが空だとNG' do
      @item.category_id = nil
      @item.valid? # validatesに引っかかるかどうか
      expect(@item.errors[:category_id]).to include
    end

    it 'カテゴリーが1だとNG' do
      @item.category_id = 1
      @item.valid? # validatesに引っかかるかどうか
      expect(@item.errors[:category_id]).to include
    end

    it '商品の状態が空だとNG' do
      @item.product_status_id = nil
      @item.valid? # validatesに引っかかるかどうか
      expect(@item.errors[:product_status_id]).to include
    end

    it '商品の状態が1だとNG' do
      @item.product_status_id = 1
      @item.valid? # validatesに引っかかるかどうか
      expect(@item.errors[:product_status_id]).to include
    end

    it '発送までの日数が空だとNG' do
      @item.days_shipping_id = nil
      @item.valid? # validatesに引っかかるかどうか
      expect(@item.errors[:days_shipping]).to include
    end

    it '発送までの日数が1だとNG' do
      @item.days_shipping_id = 1
      @item.valid? # validatesに引っかかるかどうか
      expect(@item.errors[:days_shipping]).to include
    end

    it '発送元の地域が空だとNG' do
      @item.shipping_region_id = nil
      @item.valid? # validatesに引っかかるかどうか
      expect(@item.errors[:shipping_region_id]).to include
    end

    it '発送元の地域が0だとNG' do
      @item.shipping_region_id = 0
      @item.valid? # validatesに引っかかるかどうか
      expect(@item.errors[:shipping_region_id]).to include
    end

    it '配送料が空だとNG' do
      @item.shipping_charges_id = nil
      @item.valid? # validatesに引っかかるかどうか
      expect(@item.errors[:shipping_charges_id]).to include
    end

    it '配送料が1だとNG' do
      @item.shipping_charges_id = 1
      @item.valid? # validatesに引っかかるかどうか
      expect(@item.errors[:shipping_charges_id]).to include
    end

    it '出品価格が空だとNG' do
      @item.price = nil
      @item.valid? # validatesに引っかかるかどうか
      expect(@item.errors[:price]).to include
    end

    it '出品価格が299だとNG' do
      @item.price = 299
      @item.valid? # validatesに引っかかるかどうか
      expect(@item.errors[:price]).to include('は300以上の値にしてください')
    end

    it '出品価格が10000000だとNG' do
      @item.price = 10_000_000
      @item.valid? # validatesに引っかかるかどうか
      expect(@item.errors[:price]).to include('は9999999以下の値にしてください')
    end

    # contex do

    # end
  end
end
