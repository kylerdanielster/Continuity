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
  after_save :send_mentions!

  belongs_to :user
  has_many :answers
  has_many :comments, :through => :answers
  has_many :users, :through => :answers
  has_one :chatroom

  validates :question, presence: true
  validates :details, presence: true

  def send_notifications!
    users = question_thread.users.uniq - [user]
    users.each do |user|
      NotificationMailer.question_notification(user, self).deliver_later
    end
  end

  def send_mentions!
    Mentions.send_notification_emails(:details, self)
  end
end
