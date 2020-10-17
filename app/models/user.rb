class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :transactions, foreign_key: :author_id, dependent: :destroy
  has_one_attached :avatar
end
