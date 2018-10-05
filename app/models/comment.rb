# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  answer_id  :integer
#  user_id    :integer
#

class Comment < ApplicationRecord
  after_save :send_mentions!

  belongs_to :answer
  belongs_to :user

  def send_notifications!
    users = answer.question_thread.users.uniq - [user]
    users.each do |user|
      NotificationMailer.comment_notification(user, answer).deliver_later
    end
  end

  def send_mentions!
    MentionMailer.send_mention_emails(:body, answer.question_thread)
  end
end
