module TestPassagesHelper
  
  def test_passage_result_data(test_passage)
    test_passage_success = test_passage.success?
    {header: ("The #{test_passage.test.title} is " + (test_passage_success ? "passed successfully" : "not passed")),
     success_color: ("color:" + (test_passage_success ?  "#00FF00;" : "#FF0000;"))}
  end

end
