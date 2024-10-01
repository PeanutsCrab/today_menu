class CreateLikes < ActiveRecord::Migration[7.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :menu, foreign_key: true

      t.timestamps
    end
    add_index :likes, [:user_id, :menu_id], unique: true
  end
end
