module Mentions
  extend ActiveSupport::Concern

  class_methods do
    def send_mention_emails(field, question)
      mentioned_users(field.to_s).each do |user|
        MentionMailer.send_mention_email(user, question)
      end
    end
  end

  def mentions(field)
    @mentions ||= begin
      regex = /@([\w]+)/
      field.to_s.scan(regex).flatten
    end
  end

  def mentioned_users(field)
    @mentioned_users ||= User.where(username: mentions(field))
  end
end