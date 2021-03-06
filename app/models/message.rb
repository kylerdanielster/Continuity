# == Schema Information
#
# Table name: messages
#
#  id          :bigint(8)        not null, primary key
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  chatroom_id :bigint(8)
#  user_id     :bigint(8)
#
# Indexes
#
#  index_messages_on_chatroom_id  (chatroom_id)
#  index_messages_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (chatroom_id => chatrooms.id)
#  fk_rails_...  (user_id => users.id)
#

class Message < ApplicationRecord
  after_save :send_mentions!

  belongs_to :chatroom
  belongs_to :user

  def send_mentions!
    #byebug
    MentionMailer.chat_message_mention(:body, chatroom.question_thread)
  end
end
