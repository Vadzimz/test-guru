class User < ApplicationRecord

  def tests_list_by_level(level)
    TestPassage.joins(:user, :test)
      .where(test: {level: level}, user: {id: self.id})
      .pluck(:title)
  end

end
