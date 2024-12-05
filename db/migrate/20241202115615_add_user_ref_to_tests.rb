class AddUserRefToTests < ActiveRecord::Migration[7.2]
  def change
    add_foreign_key :tests, :users, column: :author_id
  end
end
