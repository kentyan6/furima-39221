class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :family_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: PASSWORD_REGEX }
end