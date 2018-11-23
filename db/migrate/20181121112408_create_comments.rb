class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :responsible
      t.string :product
      t.string :statu
      t.datetime :time
      t.string :detail
      t.references :sfa, foreign_key: true

      t.timestamps
    end
  end
end
