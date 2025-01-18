module QuestionsHelper
  def question_header(question)
    question.persisted? ? 
      "Edit the question of #{question.test.title}" : 
      "Create a new question of #{question.test.title}"
  end
end
