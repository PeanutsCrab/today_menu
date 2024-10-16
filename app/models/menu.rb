class Menu < ApplicationRecord
  mount_uploader :menu_image, MenuImageUploader

  validates :name, uniqueness: true, presence: true, length: { maximum: 255 }
  validates :material, presence: true, length: { maximum: 255 }
  validates :process, presence: true, length: { maximum: 65_535 }

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  scope :name_contain, ->(name) { where('menus.name LIKE ?', "%#{name}%") }
  scope :material_contain, ->(material) { where('material LIKE ?', "%#{material}%") }
  scope :tag_name_contain, ->(tag_name) { joins(:tags).where(tags: { name: tag_name }) }

  def save_with_tags(tag_names:)
    ActiveRecord::Base.transaction do
    self.tags = tag_names.map { |name| Tag.find_or_initialize_by(name: name.strip) }
    save!
    end
  rescue StandardError
    false
  end

  def tag_names
    # NOTE: pluckだと新規作成失敗時に値が残らない(返り値がnilになる)
    tags.map(&:name).join(',')
  end
end