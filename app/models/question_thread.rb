# == Schema Information
#
# Table name: question_threads
#
#  id         :integer          not null, primary key
#  details    :text
#  question   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class QuestionThread < ApplicationRecord
  belongs_to :user
  has_many :question_answers

  validates :question, presence: true
  validates :details, presence: true
end
