class RenameCommentsQuestionAnswerColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :question_answer_id, :answer_id
  end
end
