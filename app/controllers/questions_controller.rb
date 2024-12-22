class QuestionsController < ApplicationController

  before_action :find_test, only: [:show, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  
  def index
    @questions = Test.find(params[:test_id]).questions
    @test = Test.find(params[:test_id])
    #render plain: @questions.pluck(:body).join("\n")
  end

  def show
    @question = Question.find(params[:id])
    #render inline: "<%= @test.title %>"
  end


  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    redirect_to @question if @question.save
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to test_questions_path(@test), status: :see_other
  end

  private

  def find_test
    test_id = Question.find(params[:id]).test_id
    @test = Test.find_by(id: test_id)
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: "Question is not found"
  end

end
