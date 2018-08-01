class ChangeCommentAnwerIdColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :answer_id, :question_answer_id
  end
end
