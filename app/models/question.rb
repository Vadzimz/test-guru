class Question < ApplicationRecord
  has_many :answers

  validates :body, presence: true
  #validate :validate_answers_count
  
  #private
  #def validate_answers_count
   # errors.add(:base, "answers count is out of range 1..4") unless answers.count.between? 1, 4
  #end
end
