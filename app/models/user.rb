class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy

  VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname, length: { maximum: 40 },presence: {messeage: "ニックネームを入力してください"}
    validates :email, presence: { message: "emailを入力してください"}
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: "パスワードを入力してください" }
    validates :password_confirmation, format: { with: VALID_PASSWORD_REGEX ,messsage: "パスワードが間違っています"}
    validates :first_name, format: { with: VALID_NAME_REGEX ,message: "名前を入力してください"}
    validates :last_name, format: { with: VALID_NAME_REGEX , message: "名前を入力してください"}
    validates :first_kana, format: { with: VALID_KANA_REGEX, message: "カナを入力してください" }
    validates :last_kana,  format: { with: VALID_KANA_REGEX , message: "カナを入力してください"}
    validates :date
  end

  with_options uniqueness: true do
    validates :nickname
    validates :email
  end

  with_options confirmation: true do
    validates :password_confirmation
  end
end
