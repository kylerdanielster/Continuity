class QuestionThreads::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer

  def new
    @comment = Comment.new
    respond_to do |format|
      format.js
    end
  end

  def create
		@comment = @answer.comments.new comment_params
		@comment.user = current_user

    if @comment.save
      # @question_answer.send_notifications!
      redirect_to question_thread_path(@answer.question_thread_id,
                                       anchor: "question_answer_#{@answer.id}"),
                                       notice: "Successfully posted!"
    else
      redirect_to question_thread_path(@answer.question_thread_id), alert: "Unable to save your comment"
    end

  end


  private

    def set_answer
      @answer = Answer.find(params[:answer_id])
    end

		def comment_params
			params.require(:comment).permit(:body)
		end

end
