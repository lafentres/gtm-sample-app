class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :title,
            presence: true,
            length: { maximum: 255 }

  validates :author,
            presence: true,
            length: { maximum: 255 }

  validates :description,
            presence: true,
            length: { maximum: 255 }

  validates :category,
            presence: true

  validates :image,
            presence: true

  has_many :likes, dependent: :destroy

  scope :newest_first, -> { order(created_at: :desc) }
end