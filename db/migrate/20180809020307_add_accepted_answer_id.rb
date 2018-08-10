class AddAcceptedAnswerId < ActiveRecord::Migration[5.2]
  def change
    add_column :question_threads, :AcceptedAnswerId, :integer
  end
end
