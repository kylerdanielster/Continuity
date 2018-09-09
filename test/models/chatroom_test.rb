# == Schema Information
#
# Table name: chatrooms
#
#  id                 :bigint(8)        not null, primary key
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  question_thread_id :integer
#

require 'test_helper'

class ChatroomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
