class QuestionsController < ApplicationController
  def new_close_ended
    @cur_question = session[:exam]['cur_question']
    @question = Question.new
  end

  def new_open_ended
    @cur_question = session[:exam]['cur_question']
    @question = Question.new
  end

  def index_close_ended
    @questions = Question.where(isClosed: true)
  end

  def index_open_ended
    @questions = Question.where(isClosed: false)
  end

  def show_close_ended
    @question = Question.find(params[:id])
  end

  def show_open_ended
    @question = Question.find(params[:id])
  end

  def create_close_ended
    data = { isClosed: true, description: params[:description], difficulty: 0, correct_alternative: params[:correct_alternative],
      alternatives: { 'a': params[:alt_a], 'b': params[:alt_b], 'c': params[:alt_c], 'd': params[:alt_d] } }
    @question = Question.new(data)
    @question.valid?
    if @question.errors.messages.length() <= 1
      if (!session['exam']['cur_question'].nil?)
        cur_question = session['exam']['cur_question']
        if (session[:questions].nil?)
          session[:questions] = {
            cur_question => data
          }
        else
          session[:questions] = session[:questions].merge({ cur_question => data })
        end
        session[:exam]['cur_question'] = session[:exam]['cur_question'] + 1
        question_type = params[:question_type]
        if question_type == 'essay'
          redirect_to questions_open_ended_new_path
        elsif question_type == 'alternative'
          redirect_to questions_close_ended_new_path
        else
          exam = session[:exam]
          questions = session[:questions]
          exam.delete('cur_question')
          @exam = Exam.create(
            name: exam["name"],
            description: exam["description"],
            start_date: exam["start_date"],
            due_date: exam["due_date"],
            duration: exam["duration"],
            time_limit: exam["time_limit"],
            user_id: exam["user_id"]
          )
          current_user.exams << @exam
          questions.each do |key, value|
            value.delete('question_type')
            value[:exam_id] = @exam.id
            Question.create(value)
          end
          session.delete(:exam)
          session.delete(:questions)
          session[:exam_created] = true
          session[:exam_code] = @exam.code
          redirect_to exams_path
        end
      end
    end
  end

  def create_open_ended
    data = { isClosed: false, description: params[:description], difficulty: 0, possible_reply: params[:possible_reply] }
    @question = Question.new(data)
    @question.valid?
    if @question.errors.messages.length() <= 1
      if (!session['exam']['cur_question'].nil?)
        cur_question = session['exam']['cur_question']
        if (session[:questions].nil?)
          session[:questions] = {
            cur_question => data
          }
        else
          session[:questions] = session[:questions].merge({ cur_question => data })
        end
        session[:exam]['cur_question'] = session[:exam]['cur_question'] + 1
        question_type = params[:question_type]
        if question_type == 'essay'
          redirect_to questions_open_ended_new_path
        elsif question_type == 'alternative'
          redirect_to questions_close_ended_new_path
        else
          exam = session[:exam]
          questions = session[:questions]
          exam.delete('cur_question')
          @exam = Exam.create(
            name: exam["name"],
            description: exam["description"],
            start_date: exam["start_date"],
            due_date: exam["due_date"],
            duration: exam["duration"],
            time_limit: exam["time_limit"],
            user_id: exam["user_id"]
          )
          current_user.exams << @exam
          questions.each do |key, value|
            value.delete('question_type')
            value[:exam_id] = @exam.id
            Question.create(value)
          end
          session.delete(:exam)
          session.delete(:questions)
          session[:exam_created] = true
          session[:exam_code] = @exam.code
          redirect_to exams_path
        end
      end
    end
  end
end
