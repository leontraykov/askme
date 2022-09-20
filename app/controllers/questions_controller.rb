class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[destroy update edit hide]
  before_action :set_question_for_current_user, only: %i[destroy update edit hide]

  def create
    question_params = params.require(:question).permit(:body, :user_id)

    @question = Question.new(question_params)
    @question.author = current_user

    if @question.save
      redirect_to user_path(@question.user), notice: "New question has been asked"
    else
      flash.now[:alert] = 'Sorry, but your question got a problem'

      render :new
    end
  end

  def index
    @questions = Question.order("created_at DESC").last(10)
    @users = User.order("created_at DESC").last(10)
  end

  def update
    question_params = params.require(:question).permit(:body, :answer)

    @question.update(question_params)

    redirect_to user_path(@question.user), notice: "Question has been edited"
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: "Question has been deleted"
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @user = User.find_by!(nickname: params[:nickname])
    @question = Question.new(user: @user)
  end

  def hide
    @question.update(hidden: true)

    redirect_to questions_path
  end

  def edit
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end
end
