class SessionsController < ApplicationController

  def new
  	# Don't let current user see the log in view
  	if current_user
  		redirect_to user_path(current_user)
  	end
  end

  def create
  	@user = User.find_by_email(params[:email])
  	# if the user exists AND the password is correct
  	if @user && @user.authenticate(params[:password])
  		# Save the user id inside the browser cookie
  		session[:user_id] = @user.id
  		flash[:notice] = "Successfully logged in"
  		redirect_to user_path(@user)
  	else
  		flash[:error] = "Incorrect email or password"
  		redirect_to login_path
  	end
  end

  def destroy
  	# Clear the browser cookie
  	session[:user_id] = nil
  	flash[:notice] = "Successfully logged out"
  	redirect_to root_path
  end

  private

  	def user_params
  		params.require(:user).permit(:email, :password)
  	end

end
