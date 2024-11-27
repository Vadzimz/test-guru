class Test < ApplicationRecord
 
belongs_to :category

  class << self
    def tests_list_by_category(category_title)
      self.joins(:category)
        .where(categories: {title: category_title})
        .order(title: :desc)
        .pluck(:title)
    end
  end
end