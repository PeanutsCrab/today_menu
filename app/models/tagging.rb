class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :menu

  validates :tag_id, uniqueness: { scope: :menu_id }
end
