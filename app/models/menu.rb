class Menu < ApplicationRecord
  mount_uploader :menu_image, MenuImageUploader

  validates :name, uniqueness: true, presence: true, length: { maximum: 255 }
  validates :material, presence: true, length: { maximum: 255 }
  validates :process, presence: true, length: { maximum: 65_535 }

  belongs_to :user
  has_many :likes, dependent: :destroy

  scope :name_contain, ->(name) { where('name LIKE ?', "%#{name}%") }
  scope :material_contain, ->(material) { where('material LIKE ?', "%#{material}%") }
  # scope :tag_name_contain, ->(tag_name) { joins(:tags).where(tags: { name: tag_name }) }
end