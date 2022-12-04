class ExamsController < ApplicationController
  before_action :set_exam, only: %i[ show edit update destroy ]

  helper_method :retrieve_last_index_page_or_default

  @@seed = 21

  # GET /exams or /exams.json
  def index
    @exams = current_user.exams
  end

  # GET /exams/1 or /exams/1.json
  def show
    @exam_attempt = current_user.exam_attempts.find_by(exam_id: params[:id])
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
      flash[:alert] = 'Successfully joined exam!'
      redirect_to exams_path
    else
      flash[:error] = 'Exam does not exist!'
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

  def show_open_question
    exam_attempt = current_user.exam_attempts.find_by(exam_id: session[:exam_id])
    
    if exam_attempt && !exam_attempt.answered
      load_data(session[:exam_id])
      close_date = exam_attempt.start_date.advance(hours: @exam.time_limit)
      if !close_date.future?
        redirect_to exams_path
      end
    else
      redirect_to exams_path
    end
  end

  def show_close_question
    exam_attempt = current_user.exam_attempts.find_by(exam_id: session[:exam_id])
    
    if exam_attempt && !exam_attempt.answered
      load_data(session[:exam_id])
      close_date = exam_attempt.start_date.advance(hours: @exam.time_limit)
      if !close_date.future?
        redirect_to exams_path
      end
    else
      redirect_to exams_path
    end
  end

  def load_data(id)
    @exam = Exam.find(id)
    @questions = @exam.questions.shuffle(random: Random.new(@@seed))
  end

  def start
    exam_attempt = current_user.exam_attempts.find_by(exam_id: params[:id])

    if exam_attempt && !exam_attempt.answered

      load_data(params[:id])
      session[:exam_id] = params[:id].to_i
      session[:replies] = []

      exam_attempt = current_user.exam_attempts.find_by(exam_id: @exam.id)
      if !exam_attempt.start_date
        exam_attempt.update(start_date: DateTime.current(), answered: false, corrected: false, grade: 0)
      end
      close_date = exam_attempt.start_date.advance(hours: @exam.time_limit)
      session[:time_to_finish] = Time.current().to_i + (close_date.to_time - Time.current()).to_i
      current_question = @questions[0]

      if current_question.isClosed
        redirect_to '/exam/close-question/0'  
      else
        redirect_to '/exam/open-question/0'
      end
    end
  end

  def answer_question
    exam_attempt = current_user.exam_attempts.find_by(exam_id: session[:exam_id])
    if exam_attempt && !exam_attempt.answered
      load_data(session[:exam_id])
      close_date = exam_attempt.start_date.advance(hours: @exam.time_limit)
      if close_date.future?
        if params[:answer]

          current_question = @questions[params[:id].to_i]
          
          reply = Reply.new
          reply.user_id = current_user.id
          reply.question_id = current_question.id
          reply.exam_id = @exam.id
          reply.answer = params[:answer]

          if current_question.isClosed
            if current_question.correct_alternative.downcase == params[:answer].downcase
              reply.correct = true
            else
              reply.correct = false
            end
          else 
            reply.grade = 0
          end

          session[:replies][params[:id].to_i] = reply
        end
        
        if params[:id].to_i+1 < @questions.length()
          current_question = @questions[params[:id].to_i+1]
          if current_question.isClosed
            redirect_to '/exam/close-question/' + (params[:id].to_i+1).to_s
          else
            redirect_to '/exam/open-question/' + (params[:id].to_i+1).to_s
          end
        else
          session[:replies].each do |rep|
            
            Reply.new({user_id: rep['user_id'], question_id: rep['question_id'], exam_id: rep['exam_id'], answer: rep['answer'], correct: rep['correct'], grade: rep['grade']}).save()
          end

          exam_attempt = current_user.exam_attempts.find_by(exam_id: @exam.id)
          exam_attempt.update(answered: true)

          redirect_to exam_path(session[:exam_id])

        end
      else
        redirect_to exams_path
      end
    else
      redirect_to exams_path
    end
  end

  def close_code_popup
    session.delete(:exam_created)
    session.delete(:exam_code)
    redirect_to exams_path
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
