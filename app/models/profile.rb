class Profile < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角で入力してください" }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角で入力してください" }
    validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/, message: "は全角カタカナで入力してください" }
    validates :family_name_kana, format: { with: /\A[ァ-ン]+\z/, message: "は全角カタカナで入力してください" }
    validates :birthday
  end
end
