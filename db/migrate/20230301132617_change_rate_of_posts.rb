class ChangeRateOfPosts < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :rate, :float, default: 0
  end
end
