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
    		["company", "store", "owner","kana", "tel", "tel2","fax", "industry" "address", "mail" , "url ", "people"]
  	end

  	
  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Post.where(
                ['company LIKE ?', "%#{company}%"],
                ['store LIKE ?', "%#{store}%"],
                ['owner LIKE ?', "%#{owner}%"],
                ['kana LIKE ?', "%#{kana}%"],
                ['tel LIKE ?', "%#{tel}%"],
                ['tel2 LIKE ?', "%#{tel2}%"],
                ['fax LIKE ?', "%#{fax}%"],
                ['industry LIKE ?', "%#{industry}%"],
                ['mail LIKE ?', "%#{mail}%"],
                ['url LIKE ?', "%#{url}%"],
                ['people LIKE ?', "%#{people}%"],
                ['address LIKE ?', "%#{address}%"],
                ['statu LIKE ?', "%#{statu}%"],
                ['time LIKE ?', "%#{time}%"],
                ['comment LIKE ?', "%#{comment}%"],
                ['created_at BETWEEN ? AND ?', from, to, "%#{created_at}%"],
                )
        
    else
      Post.all #全て表示。
    end
  end

  def next_post
    Post.where("id > ?", id).first
  end

  def prev_post
    Post.where("id < ?", id).last
  end
end