class DetailsController < ApplicationController
  before_action :load_post
  before_action :load_detail, only: [:edit,:update,:show,:destroy]
  
  def load_post
    @post = Post.find(params[:post_id])
  end
  
  def load_detail
    @detail = Detail.find(params[:id])
  end
  
  def edit
  end
  
	def update
	  if @detail.update(detail_params)
	    redirect_to post_path(@post)
	  else
	    render 'edit'
	  end
	end    

	def create
	  @detail = Detail.build
	  if  @post.details.create(detail_params)
	  redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@detail = @post.details.find(params[:id])
		@post.destroy
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