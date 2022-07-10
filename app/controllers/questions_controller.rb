class QuestionsController < ApplicationController
  before_action :set_question, only: %i[destroy show update edit hide]
  def create
    question = Question.create(question_params)

    redirect_to question, notice: "New question has been asked"
  end

  def index
    @question = Question.new
    @questions = Question.all
  end

  def update
    @question.update(question_params)

    redirect_to @question, notice: "Question has been edited"
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: "Question has been deleted"
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