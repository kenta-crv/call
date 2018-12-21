class Detail < ApplicationRecord
  belongs_to :post
  
  #TPD
  #2018.12.14
  # post ごとの最終detail抽出
  scope :joins_last_detail, -> {
    last_created_at = "SELECT sub_detail.post_id, MAX(sub_detail.created_at) as last_created_at FROM details as sub_detail GROUP BY sub_detail.post_id";
    joins(
      "INNER JOIN (#{last_created_at}) AS sub ON sub.post_id = details.post_id AND sub.last_created_at = details.created_at"
    ).group(:post_id)
  }  
  
  #TPD
  #2018.12.14
  # ステータスリスト
  @@StatuItems = [
    "着信のみ",
     "オーナー不在",
    "再コール",
    "見込み客",
    "APP",
    "フロントNG",
    "クロージングNG",
    "従業員なしNG",
    "入社年月日NG",
    "永久NG",
    "社労士契約済",
    "助成金済"
  ]
  def self.StatuItems
    @@StatuItems
  end
  
  def count
  	@detail = Detail.all.count(params[:id]) 
  end
end
