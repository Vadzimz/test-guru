class AddDetailsToTestPassages < ActiveRecord::Migration[7.2]
  def change
    add_reference :test_passages, :current_question, foreign_key: { to_table: :questions }
    remove_column :test_passages, :correct_questions, :integer
  end
end
