class Post < ApplicationRecord




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
    		["company", "owner", "tel", "address"]
  	end
  	
  	
  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      User.where(['company LIKE ?', "%#{company}%"])
    else
      User.all #全て表示。
    end
  end
  
end
