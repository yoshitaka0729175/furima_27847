class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
    VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/
    VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
    VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
    
    with_options presence: true do
    validates :nickname, length: {maximum:40}
    validates :email
    validates :password, format: {with:VALID_PASSWORD_REGEX }
    validates :password_confirmation, format: {with:VALID_PASSWORD_REGEX}
    validates :first_name, format: {with:VALID_NAME_REGEX }
    validates :last_name, format: {with:VALID_NAME_REGEX }
    validates :first_kana, format: {with:VALID_KANA_REGEX }
    validates :last_kana,  format: {with:VALID_KANA_REGEX }
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