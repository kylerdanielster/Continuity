# == Schema Information
#
# Table name: question_answers
#
#  id                 :integer          not null, primary key
#  IsAcceptedAnswer   :boolean
#  body               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  question_thread_id :integer
#  user_id            :integer
#

require 'test_helper'

class QuestionAnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
