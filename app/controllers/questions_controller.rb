class QuestionsController < ApplicationController
  def new_close_ended
    @question = Question.new
  end

  def new_open_ended
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

    respond_to do |format|
      if @question.save
        format.html { redirect_to action: 'show_close_ended', id: @question.id, notice: 'Close ended question was successfully created.' }
        format.json { render :show, status: :created, location: @close_ended_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @close_ended_question.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_open_ended
    data = { isClosed: false, description: params[:description], difficulty: 0, possible_reply: params[:possible_reply] }
    @question = Question.new(data)

    respond_to do |format|
      if @question.save
        format.html { redirect_to action: 'show_open_ended', id: @question.id, notice: 'Open ended question was successfully created.' }
        format.json { render :show, status: :created, location: @close_ended_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @close_ended_question.errors, status: :unprocessable_entity }
      end
    end
  end
end
