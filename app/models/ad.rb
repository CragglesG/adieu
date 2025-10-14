class Ad < ApplicationRecord
  belongs_to :user
  has_rich_text :description
  validates :name, presence: true
end
