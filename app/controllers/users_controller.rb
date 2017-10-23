class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def login
  end

  def logresult 
  	pp params[:user][:email]
  	@user = User.find_by_email_and_password(params[:user][:email], params[:user][:password])
  	if @user!=nil
  		session[:user] = @user.id
  		redirect_to user_path(@user.id)
  	end
  end

  def show
  	@user = User.find(session[:user])
  end

  def destroy
  	@user = User.find(session[:user])
  	@user.destroy = nil
  end


 private 

  def user_params 
  	params.require(:user).permit(:lastname, :firstname, :email, :password, :country, :city, :house_number)
  end	
end
