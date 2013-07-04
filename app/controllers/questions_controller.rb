class QuestionsController < ApplicationController
  before_filter :auth, only: [:create]

  def index
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(params[:question])
    if @question.save
      flash[:success] = 'Your question has been posted!'
      redirect_to root_url
    else
      render 'index'
    end
  end
end
