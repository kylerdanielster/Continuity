class CreateQuestionAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :question_answers do |t|
      t.integer :question_thread_id
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end
