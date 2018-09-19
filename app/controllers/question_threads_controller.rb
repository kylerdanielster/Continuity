class QuestionThreadsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question_thread, except: [:index, :new, :create]
  before_action :set_chatroom, only: [:show]
  before_action :set_chatroom_user, only: [:show]

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
    @question_thread.answers.new
  end

  def create
    @question_thread = current_user.question_threads.new question_thread_params
    @chatroom = Chatroom.new(name: "Chatroom #{@question_thread.id}", question_thread_id: @question_thread.id)

    if @question_thread.save && @chatroom.save
      redirect_to @question_thread, notice: "Successfully created!"
    else
      render action: new, alert: "Unable to create your question"
    end
  end

  def update
    if @question_thread.update question_thread_params
      # setup send_notifications!
      redirect_to question_thread_path(@question_thread), notice: "Successfully updated!"
    else
      redirect_to @question_thread, alert: "Unable to save your post"
    end
  end
  
  private
    
    def set_question_thread
      @question_thread = QuestionThread.find(params[:id])
    end

    def set_chatroom
      @chatroom = Chatroom.find_by(question_thread_id: params[:id])
      @chatroom.messages.order(created_at: :desc).limit(100).reverse
    end

    def set_chatroom_user
      if user_signed_in?
        @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).first_or_create
      end
    end

    def question_thread_params
      params.require(:question_thread).permit(:question, :details) 
    end
end
