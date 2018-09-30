# == Schema Information
#
# Table name: answers
#
#  id                 :bigint(8)        not null, primary key
#  IsAcceptedAnswer   :boolean
#  body               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  question_thread_id :integer
#  user_id            :integer
#

class Answer < ApplicationRecord
  include Mentions

  belongs_to :question_thread
  belongs_to :user
  has_many :comments

  validates :body, presence: true

  def send_notifications!
    users = question_thread.users.uniq - [user]
    users.each do |user|
      NotificationMailer.answer_notification(user, self).deliver_later
    end
  end
end
