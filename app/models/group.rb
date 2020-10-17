class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }
  has_many :transactions
  has_one_attached :picture
end
