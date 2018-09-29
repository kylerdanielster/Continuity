class QuestionThreads::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer
  before_action :set_comment, only: [:update]

  def create
		@comment = @answer.comments.new comment_params
		@comment.user = current_user

    respond_to do |format|
    if @comment.save
        # setup send_notifications!
        format.html { redirect_to question_thread_path(@answer.question_thread_id), notice: "Successfully posted!" }
        format.js
      else
        format.html { redirect_to question_thread_path(@answer.question_thread_id), alert: "Unable to save your comment" }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update comment_params
        # setup send_notifications!
        format.html { redirect_to question_thread_path(@answer.question_thread_id), notice: "Updated comment!" }
        format.js
      else
        format.html { redirect_to question_thread_path(@answer.question_thread_id), alert: "Unable to save your comment" }

      end
    end
  end

  private

    def set_answer
      @answer = Answer.find(params[:answer_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

		def comment_params
			params.require(:comment).permit(:body)
		end

end
