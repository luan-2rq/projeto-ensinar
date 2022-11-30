class ExamsController < ApplicationController
  before_action :set_exam, only: %i[ show edit update destroy ]

  # GET /exams or /exams.json
  def index
    @exams = current_user.exams
  end

  # GET /exams/1 or /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    @exam = Exam.new
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /join-exam
  def join_exam
    exam = Exam.find_by(code: params[:code])
    if exam && !current_user.exams.include?(exam)
      #add classroom to user
      user = current_user()
      user.exams << exam
      flash[:message] = 'Successfully joined exam!'
      redirect_to exams_path
    else
      flash[:message] = 'Exam does not exist!'
      redirect_to exams_path
    end
  end

  # POST /exams or /exams.json
  def create
    question_type = params[:question_type]
    params = exam_params.merge!(user_id: current_user.id)
    @exam = Exam.new(params)
    classroom_id = Classroom.where(name: 'Classe Padrão').pick(:id)
    @exam.classroom_id = classroom_id

    if @exam.valid?
      session[:exam] = params
      session[:exam].merge!(cur_question: 1)

      if question_type == 'essay'
        redirect_to questions_open_ended_new_path
      else
        redirect_to questions_close_ended_new_path
      end
    end
  end

  # PATCH/PUT /exams/1 or /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to exam_url(@exam), notice: "Exam was successfully updated." }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1 or /exams/1.json
  def destroy
    @exam.destroy

    respond_to do |format|
      format.html { redirect_to exams_url, notice: "Exam was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_params
      params.require(:exam).permit(:name, :description, :start_date, :due_date, :duration, :time_limit)
    end
end
