class Ad < ApplicationRecord
  belongs_to :user
  has_one_attached :ad_image
  has_rich_text :description
  validates :name, presence: true
end
