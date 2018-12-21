require 'rubygems'

class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    #TPD
    #2018.12.14 TPD
    # Detail/last_created に対しての条件抽出してpost_idリスト生成
    last_detail_post_ids = nil
    @last_detail_params = {}
    if !params[:last_detail].blank?
      @last_detail_params = params[:last_detail]
      last_detail = Detail.joins_last_detail
      last_detail = last_detail.where(statu: @last_detail_params[:statu]) if !@last_detail_params[:statu].blank?
      last_detail = last_detail.where("details.created_at >= ?", @last_detail_params[:created_at_from]) if !@last_detail_params[:created_at_from].blank?
      last_detail = last_detail.where("details.created_at <= ?", @last_detail_params[:created_at_to]) if !@last_detail_params[:created_at_to].blank?
      last_detail_post_ids = last_detail.pluck(:post_id)
    end
    
    @q = Post.ransack(params[:q])
    @posts = @q.result
    #TPD
    #2018.12.14
    # Detail 条件抽出したpost_id のみを検索対象にする
    @posts = @posts.where( id: last_detail_post_ids )  if !last_detail_post_ids.nil?
    @posts = @posts.page(params[:page]).per(100)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

 def create
    @post = Post.new(post_params)
    if @post.save
        # redirect
        redirect_to posts_path
    else
        render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

 def update
    @post = Post.find(params[:id])
     if @post.update(post_params)
        redirect_to posts_path
    else
        render 'edit'
    end
 end

 def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
 end

def import
  # fileはtmpに自動で一時保存される
  Post.import(params[:file])
  redirect_to root_url, notice: "リストを追加しました。"
end


  private
    def post_params
      params.require(:post).permit(
      :company, #会社名
      :store, #店舗名
      :owner, #代表者
      :kana, #ダイヒョウシャ
      :tel, #電話番号1
      :tel2, #電話番号2
      :fax, #FAX番号
      :industry, #業種
      :mail, #メール
      :url, #URL
      :people, #人数
      :address, #住所 
      :history #履歴 
       )
    end

end
