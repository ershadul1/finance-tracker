class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }
  has_one_attached :picture

  has_many :groups_transactions, foreign_key: :transaction_grouper_id
  has_many :grouped_transactions, through: :groups_transactions
end
