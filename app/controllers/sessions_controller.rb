class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:name])
    if @user.try(:authenticate,params[:password])
      session[:user_id] = @user.id
    else
      return head(:forbidden) 
    end
  end
end
