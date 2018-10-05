class NotificationMailer < ApplicationMailer

  def question_notification(user, question)
    @user = user
    @question = question

    mail(
      to: "#{user.email}",
      subject: "[Continuity App] Update in #{question.question}"
    )
  end


  def answer_notification(user, answer)
    @user = user
    @answer = answer

    mail(
      to: "#{user.email}",
      subject: "[Continuity App] New answer in #{answer.question_thread.question}"
    )
  end

  def comment_notification(user, answer)
    @user = user
    @answer = answer

    mail(
        to: "#{user.email}",
        subject: "[Continuity App] Someone commented on your answer in #{answer.question_thread.question}"
    )
  end
end
