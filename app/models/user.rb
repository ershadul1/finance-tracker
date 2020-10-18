class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :transactions, foreign_key: :author_id, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy

  after_commit :add_default_avatar, on: %i[create update]

  validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                      size: { less_than: 5.megabytes, message: 'is not given between size(5MB max)' }

  private

  def add_default_avatar
    return if avatar.attached?

    avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-user.jpg')),
                  filename: 'default.jpg', content_type: 'image/jpg')
  end
end
