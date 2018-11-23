class Detail < ApplicationRecord
  belongs_to :post
  
  def count
  	@detail = Detail.all.count(params[:id]) 
  end
end
