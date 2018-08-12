class QuestionThreadsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question_thread, except: [:index, :new, :create]

  def index
    @question_threads = QuestionThread.all
  end

  def show
		@answer = Answer.new
		answers = Answer.where(question_thread_id: @question_thread.id)
    acceptedAnswerId = @question_thread.accepted_answer_id
    @accepted_answer = answers.to_a.select { |a| a.id == acceptedAnswerId }
    @answers = answers.to_a.reject { |a| a.id == acceptedAnswerId }
  end

  def new
    @question_thread = QuestionThread.new
    @question_thread.question_answers.new
  end

  def create
    @question_thread = current_user.question_threads.new question_thread_params

    if @question_thread.save
      redirect_to @question_thread, notice: "Successfully created!"
    else
      render action: new, alert: "Unable to create your question"
    end
  end
  
  private
    
    def set_question_thread
      @question_thread = QuestionThread.find(params[:id])
    end

    def question_thread_params
      params.require(:question_thread).permit(:question, :details) 
    end
end
