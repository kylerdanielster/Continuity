class CreateChatroomThreadRelationship < ActiveRecord::Migration[5.2]
  def change
    add_column :question_threads, :chatroom_id, :integer
    add_column :chatrooms, :question_thread_id, :integer
  end
end
