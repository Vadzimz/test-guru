class AddSomeNullConstraints < ActiveRecord::Migration[7.2]
  def change
    change_column_null :tests, :title, false
    change_column_null :users, :name, false
    change_column_null :users, :surname, false
    change_column_null :categories, :title, false
    change_column_null :questions, :body, false
    change_column_null :answers, :body, false
  end
end
