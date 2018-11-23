class DetailsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@post.details.create(detail_params)
		redirect_to post_path(@post)
	end

		private
	def detail_params
		params.require(:detail).permit(
		:statu, #ステータス
		:time, #再コール
		:comment #コメント
		)
	end

end
