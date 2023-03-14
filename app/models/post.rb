class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favoriting_users, through: :favorites, source: :user
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true, length: { maximum: 20 }
  validates :place, presence: true, length: { maximum: 20 }
  validates :impression, presence: true

  mount_uploader :place_image, ImagesUploader
end
