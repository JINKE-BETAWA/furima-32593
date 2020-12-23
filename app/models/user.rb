class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :kane_first_name, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :kane_last_name, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :birthday
  end

    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both letters and numbers"}

    has_many :items
    has_many :purchases

end