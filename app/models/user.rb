class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :purchases
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "include both letters and numbers" }

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "full_width characters" }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "full_width characters" }
    validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/, message: "full_width katakana characters" }
    validates :family_name_kana, format: { with: /\A[ァ-ン]+\z/, message: "full_width katakana characters" }
    validates :birthday
  end
end
