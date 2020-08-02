class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
  validates :nickname, presence: true, uniqueness: true, length: {maximum:40}
  validates :email,    presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, format: {with:/\A[a-zA-Z0-9]+\z/}
  validates :password_confirmation, presence: true, format: {with:/\A[a-zA-Z0-9]+\z/}
  validates :first_name, presence: true, format: {with:/\A[ぁ-んァ-ン一-龥]+\z/}
  validates :last_name,  presence: true, format: {with:/\A[ぁ-んァ-ン一-龥]+\z/}
  validates :first_kana, presence: true, format: {with:/\A[ァ-ヶー－]+\z/}
  validates :last_kana,  presence: true, format: {with:/\A[ァ-ヶー－]+\z/}
  validates :date,       presence: true
end