class QuestionThreadsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question_thread, except: [:index, :new, :create]

  def index
    @question_threads = QuestionThread.all
  end

  def show
		@question_answer = QuestionAnswer.new
		@question_answers = QuestionAnswer.where(question_thread_id: @question_thread.id)

    # TODO: Find the comments for each question_answer
    # This is hardcode for now.
    @comments = Comment.where(question_answer_id: 1) #get_comments
    #byebug
  end

  def new
    @question_thread = QuestionThread.new
    @question_thread.question_answers.new
  end

  def create
    @question_thread = current_user.question_threads.new question_thread_params

    if @question_thread.save
      redirect_to @question_thread
    else
      render action: new
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
