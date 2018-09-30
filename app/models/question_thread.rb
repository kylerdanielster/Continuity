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

class QuestionThread < ApplicationRecord
  include Mentions
  #after_create :Mentions.send_notification_emails(:details)

  belongs_to :user
  has_many :answers
  has_many :comments, :through => :answers
  has_many :users, :through => :answers
  has_one :chatroom

  validates :question, presence: true
  validates :details, presence: true
end
