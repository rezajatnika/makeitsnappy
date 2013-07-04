class QuestionsController < ApplicationController
  before_filter :auth, only: [:create, :your_questions]

  def index
    @question = Question.new
    @questions = Question.unsolved(params)
  end

  def create
    @question = current_user.questions.build(params[:question])
    if @question.save
      flash[:success] = 'Your question has been posted!'
      redirect_to root_url
    else
      @questions = Question.unsolved(params)
      render 'index'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def your_questions
    @questions = current_user.your_questions(params)
  end
end
