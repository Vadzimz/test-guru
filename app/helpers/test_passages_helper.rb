module TestPassagesHelper

  def test_passage_result_header(test_passage)
    "The #{test_passage.test.title} is " + (test_passage.success? ? "passed successfully" : "not passed")
  end

  #The <%= @test_passage.test.title %> is <%= @test_passage.success? ? "passed successfully" : "not passed" %>

  def success_color_indicator(success)
    "color:" + (success ?  "#00FF00;" : "#FF0000;") 
  end

end
