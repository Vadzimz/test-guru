class Test < ApplicationRecord

    class << self
        def tests_list_by_category(category_title)
            category_id = Category.find_by(title: category_title).id
            self.where(category_id: category_id).order(title: :desc).pluck(:title)
        end
    end
end