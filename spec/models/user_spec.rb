require 'rails_helper'

describe User do
  describe '#create' do
    before do
      @user = build(:user)
    end

    it 'is valid with a nickname, email, password, password_confirmation, first_kana, last_kana, first_name, last_name, date' do
      # user = build(:user)
      expect(@user).to be_valid
    end

    it 'is invalid without a nickname' do
      # 新規登録の時にnicknameが空だと登録不可を試す
      @user.nickname = nil
      @user.valid? # validatesに引っかかるかどうか
      expect(@user.errors[:nickname]).to include('を入力してください')
      # なぜ保存できないのかを返すerrorsメソッド
    end

    it 'is invalid without a email' do
      # 新規登録の時にemailが空だと登録不可を試す
      @user.email = nil
      @user.valid? # validatesに引っかかるかどうか
      expect(@user.errors[:email]).to include('を入力してください', 'を入力してください')
      # なぜ保存できないのかを返すerrorsメソッド
    end

    it 'is invalid without a password' do
      # 新規登録の時にnpasswordが空だと登録不可を試す
      @user.password = nil
      @user.valid? # validatesに引っかかるかどうか
      expect(@user.errors[:password]).to include('を入力してください', 'を入力してください')
      # なぜ保存できないのかを返すerrorsメソッド
    end

    it 'is invalid without a password_confirmation although with a password' do
      # 新規登録の時にpasswordが空だと登録不可を試す
      @user.password_confirmation = nil
      @user.valid? # validatesに引っかかるかどうか
      expect(@user.errors[:password_confirmation]).to include('を入力してください')
      # パスワードと一致しているか確認 doesn't match Password
    end
    it 'is invalid without a first_name' do
      # 新規登録の時にfirst_nameが空だと登録不可を試す
      @user.first_name = nil
      @user.valid? # validatesに引っかかるかどうか
      expect(@user.errors[:first_name]).to include('名前を入力してください')
      # なぜ保存できないのかを返すerrorsメソッド
    end
    it 'is invalid without a last_name' do
      # 新規登録の時にlast_nameが空だと登録不可を試す
      @user.last_name = nil
      @user.valid? # validatesに引っかかるかどうか
      expect(@user.errors[:last_name]).to include('名前を入力してください')
      # なぜ保存できないのかを返すerrorsメソッド
    end

    it 'is invalid without a first_kana' do
      # 新規登録の時にfirst_kanaが空だと登録不可を試す
      @user.first_kana = nil
      @user.valid? # validatesに引っかかるかどうか
      expect(@user.errors[:first_kana]).to include('を入力してください', 'カナを入力してください')
      # なぜ保存できないのかを返すerrorsメソッド
    end
    it 'is invalid without a last_kana' do
      # 新規登録の時にnlast_kanaが空だと登録不可を試す
      @user.last_kana = nil
      @user.valid? # validatesに引っかかるかどうか
      expect(@user.errors[:last_kana]).to include('を入力してください', 'カナを入力してください')
      # なぜ保存できないのかを返すerrorsメソッド
    end
    it 'is invalid without a date' do
      # 新規登録の時にdateが空だと登録不可を試す
      @user.date = nil
      @user.valid? # validatesに引っかかるかどうか
      expect(@user.errors[:date]).to include('を入力してください')
      # なぜ保存できないのかを返すerrorsメソッド
    end

    # passwordが6文字以上であれば登録できること
    it 'is valid with a password that has more than 6 characters ' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      expect(@user).to be_valid
    end

    # 重複したemailが存在する場合登録できないこと
    it 'is invalid with a duplicate email address' do
      @user = create(:user)
      another_user = build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('はすでに存在します', 'はすでに存在します')
    end

    # passwordが5文字以下であれば登録できないこと
    it 'is invalid with a password that has less than 5 characters ' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors[:password]).to include('は6文字以上で入力してください')
    end
  end
end
