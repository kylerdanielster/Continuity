class MentionMailer < ApplicationMailer

  def chat_message_mention(field, question)
    #byebug
    mentioned_users(field.to_s).each do |user|
      mail(
          to: "#{user.email}",
          subject: "[Continuity App] You were mentioned in #{question.question}"
      )
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
