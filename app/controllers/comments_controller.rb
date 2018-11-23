class CommentsController < ApplicationController

  def create
	@sfa = Sfa.find(params[:sfa_id])
	@sfa.comments.create(comment_params)
	redirect_to sfa_path(@sfa)
  end
  
  


	private
  def comment_params
	params.require(:comment).permit(
      :responsible,  #営業担当
      :product,  #商品名
      :statu,  #ステータス
      :time,  #次回営業日
      :detail,  #詳細
	)
  end

end
