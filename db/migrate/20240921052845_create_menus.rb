class CreateMenus < ActiveRecord::Migration[7.2]
  def change
    create_table :menus do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :material, null: false
      t.text :process, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
