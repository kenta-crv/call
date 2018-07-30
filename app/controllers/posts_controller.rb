class PostsController < ApplicationController

before_action :authenticate_user!

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.page(params[:page]).per(30)
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
    
        begin
      account_id = "AC2c48a3706b037c446af52fc71ef8c952"
      auth_token = "274088d04ffc1375653cd1dd3929af17"
      client = Twilio::REST::Client.new(account_id, auth_token)
      client.account.calls.create(
        from: "+815031962874",
        to: "+818020451020",
        url: "http://demo.twilio.com/docs/voice.xml",
        method: "GET",
      )
 
 #error handling
    rescue Twilio::REST::RequestError => e
      puts e.message
    end

    redirect_to action: :index
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
      :company, 
      :owner, 
      :tel, 
      :address, 
      :people, 
      :status,
      :datetime,
      :comment)
    end    

end
