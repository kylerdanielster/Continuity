class QuestionThreads::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question_answer

  # Thinking this should create new comment 
  # The use jquery to show the form
  def new
    @question_answer.comments.new
    #redirect_to question_thread_path(@question_answer.question_thread_id)
    respond_to do |format|
      format.js
    end
  end

  # Need to add form to test create
  def create
		@comment = @question_answer.comment.new comment_params
		@comment.user = current_user

    if @comment.save
      # @question_answer.send_notifications!
      redirect_to question_thread_path(@question_answer.question_thread_id, anchor: "question_answer_#{@question_answer.id}"), notice: "Successfully posted!"
    else
      redirect_to question_thread_path(@question_answer.question_thread_id), alert: "Unable to save your comment"
    end

  end


  private

    def set_question_answer
      @question_answer = QuestionAnswer.find(params[:question_answer_id])
    end

		def comment_params
			params.require(:comment).permit(:body)
		end

end
