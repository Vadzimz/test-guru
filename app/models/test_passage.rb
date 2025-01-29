class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: %i[create update]

  def completed?
    current_question.nil?
  end
  
  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_answers += 1
    end
    save!
  end

  SUCCESS_FACTOR = 85

  def success_percentage
    self.correct_answers * 100.0 / self.test.questions.count
  end

  def success?
    success_percentage >= SUCCESS_FACTOR
  end
  
  private

  def before_validation_set_question
    self.current_question = new_record? ? test.questions.first : test.questions.order(:id).where(id: (current_question.id + 1)..).first
  end

  def correct_answer?(answer_ids)
    get_correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def get_correct_answers
    current_question.answers.correct
  end

end
