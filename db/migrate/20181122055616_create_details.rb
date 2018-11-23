class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.string :statu
      t.datetime :time
      t.string :comment
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
