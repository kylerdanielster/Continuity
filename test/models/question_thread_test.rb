# == Schema Information
#
# Table name: question_threads
#
#  id               :integer          not null, primary key
#  AcceptedAnswerId :integer
#  details          :text
#  question         :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#

require 'test_helper'

class QuestionThreadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
