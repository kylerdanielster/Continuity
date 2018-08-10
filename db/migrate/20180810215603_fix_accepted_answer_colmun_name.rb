class FixAcceptedAnswerColmunName < ActiveRecord::Migration[5.2]
  def change
    rename_column :question_threads, :AcceptedAnswerId, :accepted_answer_id
  end
end
