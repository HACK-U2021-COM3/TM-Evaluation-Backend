class PastPlanIdReqParams < RequestDto
  # user_idとplans_idはバリデーションの必要性なし
  attr_accessor :user_id, :plans_id

  def initialize(params={})
    @user_id = params[:user_id]
    @plans_id = params[:plans_id]
  end

end
  

  