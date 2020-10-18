class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }
  has_one_attached :picture, dependent: :destroy

  has_many :groups_transactions, foreign_key: :transaction_grouper_id
  has_many :grouped_transactions, through: :groups_transactions

  after_commit :add_default_picture, on: %i[create update]

  validates :picture, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                      size: { less_than: 5.megabytes, message: 'is not given between size(5MB max)' }

  private

  def add_default_picture
    return if picture.attached?

    picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-image.jpg')),
                   filename: 'default.jpg', content_type: 'image/jpg')
  end
end
