class CreateSfas < ActiveRecord::Migration[5.2]
  def change
    create_table :sfas do |t|
      t.string :company #会社名
      t.string :store #店舗名
      t.string :owner #代表者
      t.string :kana #ダイヒョウシャ
      t.string :person #担当者
      t.string :p_kana #タントウシャ
      t.string :tel #電話番号1
      t.string :tel2 #電話番号2
      t.string :fax #FAX番号
      t.string :industry #業種
      t.string :mail #メール
      t.string :url #URL
      t.string :people #人数
      t.string :post_number #郵便番号
      t.string :address #住所
      t.string :employment #雇用保険
      t.string :social #社会保険
      t.string :appointer #アポ担当
      t.string :sales_staff #営業担当
      t.string :sales_day #営業日時
      t.string :status #見込みステータス
      t.string :target #対象人数
      t.string :sales_forecast #売上予想
      t.string :impression #印象
      t.string :repeat_sales #リピート営業
      t.string :next_sales #次回追い日
      t.string :prospect #見込
      t.string :ditails #詳細
      t.string :examination #審査内容

      t.timestamps
    end
  end
end
