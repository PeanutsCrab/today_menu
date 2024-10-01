class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true

  has_many :menus, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likes_menus, through: :likes, source: :menu

  def own?(object)
    id == object&.user_id
  end

  def likemenu(menu)
    likes_menus << menu
  end

  def unlikemenu(menu)
    likes_menus.destroy(menu)
  end

  def likesmenu?(menu)
    likes_menus.include?(menu)
  end
end