class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show destroy]
  before_action :authorize_user, only: %i[edit update destroy]

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
  end

  def update
    if @user.update(user_params)
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User successfully edited!'
    else
      flash.now[:alert] = 'Sorry, but edition form filled out incorrectly'

      render :edit
    end
  end

  def destroy
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path, notice: "User has been deleted"
  end

  def show
    @questions = @user.questions.order("created_at DESC")
    @question = Question.new(user: @user)
  end

  private

  def authorize_user
    redirect_with_alert unless current_user == @user
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name, :nickname, :email, :header_color, :password, :password_confirmation
    )
  end
end
