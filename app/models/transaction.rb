class Transaction < ApplicationRecord
  validates :name, presence: true, length: { in: 2..50 }
  validates :amount, presence: true, numericality: { less_than: 1_000_000_000 }
  belongs_to :author, class_name: 'User'

  has_many :groups_transactions, foreign_key: :grouped_transaction_id
  has_many :transaction_grouper, through: :groups_transactions

  scope :total_spent, -> { where(earning: false).sum(:amount) }
  scope :total_earned, -> { where(earning: true).sum(:amount) }
end
