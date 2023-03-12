class ChangeRateDefaultOfPosts < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :rate, :float
  end
end
