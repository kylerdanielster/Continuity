class QuestionThreads::AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question_thread

	# create for POST to save instance created in new method
	def create
		@answer = @question_thread.answers.new answer_params
		@answer.user = current_user
    respond_to do |format|
      if @answer.save
        # @question_thread.send_notifications!
        format.html { redirect_to question_thread_path(@question_thread, anchor: "answer_#{@answer.id}"),
                    notice: "Successfully posted!" }
        format.js
      else
        format.html { redirect_to @question_thread, alert: "Unable to save your post" }
        format.js
      end
    end
  end

	def update
    respond_to do |format|
      if @answer.update answer_params
        # @question_thread.send_notifications!
        format.html { redirect_to question_thread_path(@question_thread, anchor: "answer_#{@answer.id}"),
                    notice: "Successfully updated!" }
        format.js
      else
        format.html { redirect_to @question_thread, alert: "Unable to save your post" }
        format.js
      end
    end
  end

	private 

    def set_question_thread
      @question_thread = QuestionThread.find(params[:question_thread_id])
    end

		def answer_params
			params.require(:answer).permit(:body)
		end
end
