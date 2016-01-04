class UsersController < ApplicationController
  # before_filter :authorize

  def index
    @users = User.all
  end

  def new
    if current_user
      redirect_to "/users/#{current_user.id}"
    else
      @user = User.new
    end
  end

  def create
    if current_user
      redirect_to "/users/#{current_user.id}"
    else
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.user_id
        flash[:notice] = "Successfully signed up"
        redirect_to user_path(@user)
      else
        flash[:error] = @user.errors.full_messages.join(", ")
        redirect_to signup_path
      end
    end    
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
