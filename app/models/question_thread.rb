# == Schema Information
#
# Table name: question_threads
#
#  id                 :integer          not null, primary key
#  details            :text
#  question           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  accepted_answer_id :integer
#  user_id            :integer
#

class QuestionThread < ApplicationRecord
  belongs_to :user
  has_many :answers

  validates :question, presence: true
  validates :details, presence: true
end
