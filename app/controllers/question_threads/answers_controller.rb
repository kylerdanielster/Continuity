class QuestionThreads::AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question_thread

	# create for POST to save instance created in new method
	def create
		@question_answer = @question_thread.question_answers.new question_answer_params
		@question_answer.user = current_user

    respond_to do |format|
      if @question_answer.save
        # @question_thread.send_notifications!
        format.html { redirect_to question_thread_path(@question_thread, anchor: "question_answer_#{@question_answer.id}"),
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
      if @question_answer.update question_answer_params
        # @question_thread.send_notifications!
        format.html { redirect_to question_thread_path(@question_thread, anchor: "question_answer_#{@question_answer.id}"),
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

		def question_answer_params
			params.require(:question_answer).permit(:body)
		end
end
