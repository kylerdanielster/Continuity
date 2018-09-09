class ChatroomUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  def create
    @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).first_or_create
    byebug
    redirect_to question_thread_path(@chatroom.question_thread_id)
  end

  def destroy
    @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).destroy_all
    redirect_to question_thread_path(@chatroom.question_thread_id)
  end

  private

    def set_chatroom
      @chatroom = Chatroom.find(params[:chatroom_id])
    end
end