class Test < ApplicationRecord
  
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  belongs_to :category
  belongs_to :user, foreign_key: "author_id"

  class << self
    def tests_list_by_category(category_title)
      self.joins(:category)
        .where(categories: {title: category_title})
        .order(title: :desc)
        .pluck(:title)
    end
  end
end