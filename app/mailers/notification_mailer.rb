class NotificationMailer < ApplicationMailer

  def question_thread_notification(user, answer)
    @user = user
    @answer = answer

    mail(
      to: "#{user.email}",
      subject: "[Continuity App] New answer in #{answer.question_thread.question}"
    )
  end
end
