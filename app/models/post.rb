# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  company    :string
#  owner      :string
#  tel        :string
#  address    :string
#  people     :string
#  status     :string
#  datetime   :string
#  comment    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
    has_many :details

   validates :company, presence: true
   validates :tel, presence: true
   validates :industry, presence: true
   validates :address, presence: true

   def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
		# IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
        post = find_by(id: row["id"]) || new
        # CSVからデータを取得し、設定する
        post.attributes = row.to_hash.slice(*updatable_attributes)
        # 保存する
        post.save!
       end
    end

    def self.updatable_attributes
    		["company", "store", "owner","kana", "tel", "tel2","fax", "industry", "address", "mail", "url", "people", "history"]
  	end
  	


  def next_post
    Post.where("id > ?", id).first
  end

  def prev_post
    Post.where("id < ?", id).last
  end
end