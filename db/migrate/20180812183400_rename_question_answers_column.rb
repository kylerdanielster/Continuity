class RenameQuestionAnswersColumn < ActiveRecord::Migration[5.2]
  def change
    rename_table :question_answers, :answers
  end
end
