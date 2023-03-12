class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, limit: 20, null: false
      t.string :place, limit: 20, null: false
      t.float :rate
      t.text :impression, null: false
      t.string :place_image
      t.integer :user_id

      t.timestamps
    end
  end
end
