class AddMenuImageToMenus < ActiveRecord::Migration[7.2]
  def change
    add_column :menus, :menu_image, :string
  end
end
