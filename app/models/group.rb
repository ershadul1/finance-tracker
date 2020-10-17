class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :transactions
  has_one_attached :picture
end
