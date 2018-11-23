class SfasController < ApplicationController
  def index
    @q = Sfa.ransack(params[:q])
  	#@sfas = @q.result.page(params[:page].per(100))
  	@sfas = Sfa.all.order(created_at: 'desc')
  end
  
  def show
  	@sfa = Sfa.find(params[:id])
  end
  
  def new
  	@sfa = Sfa.new
  end
  
  def create
  	@sfa = Sfa.new(sfa_params)
  	if @sfa.save
  		redirect_to sfas_path
  	else
  		render 'new'
  	end
  end
 
  def edit
  	@sfa = Sfa.find(params[:id])
  end
  
  def update 
  	@sfa = Sfa.find(params[:id])
  	if @sfa.update(sfa_prams)
  		redirect_to sfas_path
  	else
  		render 'edit'
  	end
  end
  
  def destroy
  	@sfa = Sfa.find(params[:id])
  	@sfa.destroy
  	redirect_to sfas_path
  end
  
  def import
  # fileはtmpに自動で一時保存される
    Sfa.import(params[:file])
    redirect_to root_url, notice: "リストを追加しました。"
  end
  
  private
  def sfa_params
  params.require(:sfa).permit(
      :company, #会社名
      :store, #店舗名
      :owner, #代表者
      :kana, #ダイヒョウシャ
      :person, #担当者
      :p_kana, #タントウシャ
      :tel, #電話番号1
      :tel2, #電話番号2
      :fax, #FAX番号
      :industry, #業種
      :mail, #メール
      :url, #URL
      :people, #人数
      :post_number, #郵便番号
      :address, #住所
      :employment, #雇用保険
      :social, #社会保険
      :appointer, #アポ担当
      :sales_staff, #営業担当
      :sales_day, #営業日時
      :status, #見込みステータス
      :target, #対象人数
      :sales_forecast, #売上予想
      :impression, #印象
      :repeat_sales, #リピート営業
      :next_sales, #次回追い日
      :prospect, #見込
      :ditails, #詳細
      :examination #審査内容
  )
  end
end
