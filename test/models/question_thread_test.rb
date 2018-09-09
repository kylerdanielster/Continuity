# == Schema Information
#
# Table name: question_threads
#
#  id                 :bigint(8)        not null, primary key
#  details            :text
#  question           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  accepted_answer_id :integer
#  chatroom_id        :integer
#  user_id            :integer
#

require 'test_helper'

class QuestionThreadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
