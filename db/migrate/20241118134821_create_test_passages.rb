class CreateTestPassages < ActiveRecord::Migration[7.2]
  def change
    create_table :test_passages do |t|
      t.integer :correct_answers, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
