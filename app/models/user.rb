class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :purchases
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は半角英数字をそれぞれ一文字以上使用してください" }

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角で入力してください" }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角で入力してください" }
    validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/, message: "は全角カタカナで入力してください" }
    validates :family_name_kana, format: { with: /\A[ァ-ン]+\z/, message: "は全角カタカナで入力してください" }
    validates :birthday
  end
end
