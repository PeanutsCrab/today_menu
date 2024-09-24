class Menu < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :material, presence: true, length: { maximum: 255 }
  validates :process, presence: true, length: { maximum: 65_535 }

  belongs_to :user
end
