class OpenEndedQuestionsController < ApplicationController
  def index
    @open_ended_questions = OpenEndedQuestion.all
  end

  def new
    @open_ended_question = OpenEndedQuestion.new
  end

  def create
    @open_ended_question = OpenEndedQuestion.new(open_ended_question_params)

    respond_to do |format|
      if @open_ended_question.save
        format.html { redirect_to open_ended_question_url(@open_ended_question), notice: "Close ended question was successfully created." }
        format.json { render :show, status: :created, location: @open_ended_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @open_ended_question.errors, status: :unprocessable_entity }
      end
    end
  end

  def open_ended_question_params
    params.require(:open_ended_question).permit(:description, :difficulty, :alternative_a, :alternative_b, :alternative_c, :alternative_d, :correct_alternative)
  end
end
