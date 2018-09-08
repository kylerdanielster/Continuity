# == Schema Information
#
# Table name: chatroom_users
#
#  id          :bigint(8)        not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  chatroom_id :bigint(8)
#  user_id     :bigint(8)
#
# Indexes
#
#  index_chatroom_users_on_chatroom_id  (chatroom_id)
#  index_chatroom_users_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (chatroom_id => chatrooms.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class ChatroomUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
