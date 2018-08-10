class QuestionThreads::AcceptedAnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_question_thread, only: [:create]

  # TODO: Consider changing this to update method
  def create
    @question_thread.AcceptedAnswerId = accepted_answer_params[:question_answer_id]
    @question_thread.save
    redirect_to question_thread_url(accepted_answer_params[:question_thread_id])
  end

    private

      def accepted_answer_params
        params.permit(:question_answer_id, :question_thread_id)
      end

      def set_question_thread
        @question_thread = QuestionThread.find(accepted_answer_params[:question_thread_id])
      end
end