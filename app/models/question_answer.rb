# == Schema Information
#
# Table name: question_answers
#
#  id                 :integer          not null, primary key
#  body               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  question_thread_id :integer
#  user_id            :integer
#

class QuestionAnswer < ApplicationRecord
  belongs_to :question_thread
  belongs_to :user
end
