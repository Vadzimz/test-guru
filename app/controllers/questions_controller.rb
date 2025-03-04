class QuestionsController < ApplicationController

  before_action :find_test, only: [:new, :create]
  before_action :find_question, only: [:show, :destroy, :edit, :update]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(@question.test), status: :see_other
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question is not found"
  end

end
