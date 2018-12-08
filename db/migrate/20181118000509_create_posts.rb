class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :company, null: false #会社名
      t.string :store #店舗名
      t.string :owner #代表者
      t.string :kana #ダイヒョウシャ
      t.string :tel, null: false #電話番号1
      t.string :tel2 #電話番号2
      t.string :fax #FAX番号
      t.string :industry, null: false #業種
      t.string :mail #メール
      t.string :url #URL
      t.string :people #人数
      t.string :address, null: false #住所
      t.string :history #履歴
      t.timestamps null: false
    end
  end
end
