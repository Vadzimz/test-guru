class Test < ApplicationRecord
  
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id", inverse_of: :own_tests

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :complicated, -> { where(level: 5..) }

  scope :selected_by_category, -> (category_title) { joins(:category).where(categories: {title: category_title}).order(title: :desc).pluck(:title) }
  #with ruby methods
  scope :selected_by_category_v2, -> (category_title) { select{ |x| x.category.title == category_title}.sort_by(&:title).reverse.pluck(:title) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, in: 0.. }

  class << self
    def show_list_by_category(category_title)
      Category.find_by!(title: category_title).tests.order(title: :desc).pluck(:title)
    end
  end



end