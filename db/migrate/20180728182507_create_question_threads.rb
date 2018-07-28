class CreateQuestionThreads < ActiveRecord::Migration[5.2]
  def change
    create_table :question_threads do |t|
      t.integer :user_id
      t.string :question
      t.text :details

      t.timestamps
    end
  end
end
