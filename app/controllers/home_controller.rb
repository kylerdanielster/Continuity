class HomeController < ApplicationController

  def index
  end

  def terms
  end

  def privacy
  end

  def search
    @questions = QuestionThread.ransack(question_or_details_cont: params[:q]).result(distinct: true)
    @messages = Message.ransack(body_cont: params[:q]).result(distinct: true)
    @answers = Answer.ransack(body_cont: params[:q]).result(distinct: true)

    respond_to do |format|
      format.html {}
      format.json {
        @questions = @questions.limit(3)
        @answers = @answers.limit(3)
        @messages = @messages.limit(3)
      }
    end
  end
end
