class AddSomeDefaultValues < ActiveRecord::Migration[7.2]
  def change
    change_column_default :tests, :level, from: nil, to: 0
    change_column_default :answers, :correct, from: nil, to: true 
  end
end
