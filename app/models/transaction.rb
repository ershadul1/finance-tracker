class Transaction < ApplicationRecord
  validates :name, presence: true, length: { in: 2..50 }
  validates :amount, presence: true, numericality: { less_than: 1_000_000_000, greater_than_or_equal_to: 0 }
  belongs_to :author, class_name: 'User'

  has_many :groups_transactions, foreign_key: :grouped_transaction_id
  has_many :transaction_grouper, through: :groups_transactions

  scope :total_spent, -> { where(earning: false).sum(:amount) }
  scope :total_earned, -> { where(earning: true).sum(:amount) }
  scope :balance, -> { total_earned - total_spent }

  scope :group_spent, ->(user_id) { where('author_id = ?', user_id).total_spent }
  scope :group_earned, ->(user_id) { where('author_id = ?', user_id).total_earned }

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
