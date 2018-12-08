class AddHistoryToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :history, :string
  end
end
