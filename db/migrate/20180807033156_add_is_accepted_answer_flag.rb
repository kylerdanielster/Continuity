class AddIsAcceptedAnswerFlag < ActiveRecord::Migration[5.2]
  def change
    add_column :question_answers, :IsAcceptedAnswer, :boolean
  end
end
