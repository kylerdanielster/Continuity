json.questions do
  json.array!(@questions) do |question|
    json.value question.question
    json.url question_thread_path(question)
  end
end

json.details do
  json.array!(@questions) do |question|
    json.value question.details
    json.url question_thread_path(question)
  end
end

json.answers do
  json.array!(@answers) do |answer|
    json.value answer.body
    json.url question_thread_path(answer.question_thread_id.to_s)
    end
  end

json.messages do
  json.array!(@messages) do |message|
    json.value message.body
    json.url question_thread_path(message.chatroom_id.to_s)
  end
end