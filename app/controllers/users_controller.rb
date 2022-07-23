class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully registered! You can ask now!'
    else
      flash.now[:alert] = 'Sorry, but registration form filled out incorrectly'

      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User successfully edited!'
    else
      flash.now[:alert] = 'Sorry, but edition form filled out incorrectly'

      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path, notice: "User has been deleted"
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :nickname, :email, :header_color, :password, :password_confirmation
    )
  end
end
