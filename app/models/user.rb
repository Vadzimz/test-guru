class User < ApplicationRecord

  def tests_list_by_level(level)
    passages = TestPassage.where(user_id: self.id).pluck(:test_id)
    Test.where(id: passages, level: level)
  end

end

