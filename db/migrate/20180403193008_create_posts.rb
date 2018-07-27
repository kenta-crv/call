class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :company #会社名
      t.string :owner #代表者
      t.string :tel #電話番号
      t.string :address #住所
      t.string :people #人数
      t.string :status #ステータス
      t.string :datetime #再コール
      t.string :comment #コメント

      t.timestamps
    end
  end
end
