class CloseEndedQuestionsController < ApplicationController
  before_action :set_close_ended_question, only: %i[ show edit update destroy ]

  # GET /close_ended_questions or /close_ended_questions.json
  def index
    @close_ended_questions = CloseEndedQuestion.joins(:question)
      .select(:alternatives, :correct_alternative, :'questions.id', :'questions.description', :'questions.difficulty')
  end

  # GET /close_ended_questions/1 or /close_ended_questions/1.json
  def show
  end

  # GET /close_ended_questions/new
  def new
    @close_ended_question = CloseEndedQuestion.new
  end

  # GET /close_ended_questions/1/edit
  def edit
  end

  # POST /close_ended_questions or /close_ended_questions.json
  def create
    data = {}
    data.isClosed = true
    data.description = close_ended_question_params[:description]
    data.difficulty = 0
    data.correct_alternative = close_ended_question_params[:correct_alternative]
    data.alternatives = { 'a' => data[:alt_a], 'b' => data[:alt_b], 'c' => data[:alt_c], 'd' => data[:alt_d] }
    @question = Question.new(data)

    respond_to do |format|
      if @question.save
        format.html { redirect_to action: 'show', id: @question.id, notice: "Close ended question was successfully created." }
        format.json { render :show, status: :created, location: @close_ended_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @close_ended_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /close_ended_questions/1 or /close_ended_questions/1.json
  def update
    respond_to do |format|
      if @close_ended_question.update(close_ended_question_params)
        format.html { redirect_to close_ended_question_url(@close_ended_question), notice: "Close ended question was successfully updated." }
        format.json { render :show, status: :ok, location: @close_ended_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @close_ended_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /close_ended_questions/1 or /close_ended_questions/1.json
  def destroy
    @close_ended_question.destroy

    respond_to do |format|
      format.html { redirect_to close_ended_questions_url, notice: "Close ended question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_close_ended_question
    @close_ended_question = CloseEndedQuestion.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def close_ended_question_params
    params.require(:close_ended_question).permit(:description, :difficulty, :alternatives, :correct_alternative, :alt_a, :alt_b, :alt_c, :alt_d)
  end
end
