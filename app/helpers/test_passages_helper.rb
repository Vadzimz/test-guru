module TestPassagesHelper

  def test_passage_result_header(test_passage)
    "The #{test_passage.test.title} is " + (test_passage.success? ? "passed successfully" : "not passed")
  end

  def success_color_indicator(test_passage)
    "color:" + (test_passage.success? ?  "#00FF00;" : "#FF0000;") 
  end

  def test_passage_result_data(test_passage)
    {header: test_passage_result_header(test_passage), 
     success_color: success_color_indicator(test_passage)}
  end

end
