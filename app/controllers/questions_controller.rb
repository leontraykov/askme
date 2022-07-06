class QuestionsController < ApplicationController
  before_action :set_question, only: %i[destroy show update edit hide]
  def create
    question = Question.create(question_params)

    redirect_to question
  end

  def index
    # debugger
    @questions = Question.all
  end

  def update
    @question.update(question_params)
    redirect_to @question
  end

  def destroy
    @question.destroy

    redirect_to questions_path
  end

  def show
  end

  def new
    @question = Question.new
  end

  def hide
    @question.update(hidden: true)

    redirect_to questions_path
  end

  def edit
  end
end

private

def question_params
  params.require(:question).permit(:body, :user_id)
end

def set_question
  @question = Question.find(params[:id])
end