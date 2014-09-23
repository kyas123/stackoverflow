class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end


  def index
    @user = User.new
    @question = Question.new
    @questions = Question.all
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      flash[:notice] = "GOOD JOB BUDDY"
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end
end

private
  def question_params
    params.require(:question).permit(:content, :user_id)
  end

