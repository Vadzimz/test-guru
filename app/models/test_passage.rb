class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

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

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end

  
  def correct_answer?(answer_ids)
    get_correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def get_correct_answers
    current_question.answers.correct
  end
  
  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
