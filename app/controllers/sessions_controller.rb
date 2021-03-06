class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name])
    if !@user.nil? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to 'login', alert: "Password is incorrect."
    end
  end


end