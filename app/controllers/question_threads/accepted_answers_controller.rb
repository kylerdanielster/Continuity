class QuestionThreads::AcceptedAnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_question_thread, only: [:create]

  # TODO: Consider changing this to update method
  def create
    @question_thread.accepted_answer_id = accepted_answer_params[:answer_id]
    if @question_thread.save
      redirect_to question_thread_url(accepted_answer_params[:question_thread_id], notice: "Saved as accepted answer")
    else
      redirect_to question_thread_url(accepted_answer_params[:question_thread_id], notice: "Unable to save as accepted")
    end
  end

    private

      def accepted_answer_params
        params.permit(:answer_id, :question_thread_id)
      end

      def set_question_thread
        @question_thread = QuestionThread.find(accepted_answer_params[:question_thread_id])
      end
end