class Transaction < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true
  belongs_to :author, class_name: 'User'
end
