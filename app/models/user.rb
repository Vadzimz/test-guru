class User < ApplicationRecord
  
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: "Test", foreign_key: "author_id", inverse_of: :author

  def tests_list_by_level(level)
    TestPassage.joins(:user, :test)
      .where(test: {level: level}, user: {id: self.id})
      .pluck(:title)
  end

end
