class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answers, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_count_of_question_answers

  private

  def validate_count_of_question_answers
    errors.add(:base, "answers count for this question is out of range 1..4") unless (question.answers.count + 1).between? 1, 4
  end
end