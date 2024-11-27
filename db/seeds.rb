# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#categories = %w(Javascript  SQL  Java  Ruby).each {|cat| Category.find_or_create_by!(title: cat)}

categories = Category.create!([{title: "Javascript"}, {title: "SQL"}, {title: "Java"}, {title: "Ruby"}])


users = User.create!([
  {name: "Brenda", surname: "Nazario", email: "BrendaMNazario@rhyta.com"},
  {name: "Zara", surname: "Rose", email: "ZaraRose@jourrapide.com"},
  {name: "Corey", surname: "Warren", email: "CoreyWarren@armyspy.com"},
  {name: "Madeleine", surname: "Hamilton", email: "MadeleineHamilton@armyspy.com"},
  {name: "Lewis", surname: "Potts", email: "LewisPotts@rhyta.com"}])

#User.create!(users)

tests = Test.create!([
  {title: "Javascript test", level: 1, category_id: categories[0].id}, 
  {title: "SQL basics", category_id: categories[1].id}, 
  {title: "Java test", level: 1, category_id: categories[2].id}])

#Test.create!(tests)

questions = Question.create!([
  {body: "Which function is used to serialize an object into a JSON string in Javascript?", test_id: tests[0].id},
  {body: "Which object in Javascript doesn’t have a prototype?", test_id: tests[0].id},
  {body: "What command is used to create a new table in SQL?", test_id: tests[1].id},
  {body: "Automatic type conversion is possible in which of the possible cases?", test_id: tests[2].id},
  {body: "Identify the Microsoft solution for providing dynamic web content", test_id: tests[2].id}])

#Question.create!(questions)        

answers = Answer.create!([
  {body: "stringify()", correct: true, question_id: questions[0].id},
  {body: "parse()", question_id: questions[0].id},
  {body: "convert()", question_id: questions[0].id},
  {body: "None of the above", question_id: questions[0].id},
  {body: "Base Object", correct: true, question_id: questions[1].id},
  {body: "All objects have a prototype",  question_id: questions[1].id},
  {body: "None of the objects have a prototype", question_id: questions[1].id},
  {body: "None of the above", question_id: questions[1].id},
  {body: "CREATE TABLE", correct: true, question_id: questions[2].id},
  {body: "BUILD TABLE", question_id: questions[2].id},
  {body: "GENERATE TABLE", question_id: questions[2].id},
  {body: "None of the above", question_id: questions[2].id},
  {body: "Byte to int", question_id: questions[3].id},
  {body: "Int to long", correct: true, question_id: questions[3].id},
  {body: "Long to int", question_id: questions[3].id},
  {body: "Short to int", question_id: questions[3].id},
  {body: "ASP", question_id: questions[4].id},
  {body: "JSP", correct: true, question_id: questions[4].id},
  {body: "Both A and B", question_id: questions[4].id},
  {body: "None of the above", question_id: questions[4].id}])

#Answer.create!(answers)

test_passages = TestPassage.create!([{user_id: users[0].id, test_id: tests[0].id, correct_answers: 2},
  {user_id: users[0].id, test_id: tests[1].id, correct_answers: 3},
  {user_id: users[0].id, test_id: tests[2].id, correct_answers: 1},
  {user_id: users[1].id, test_id: tests[0].id, correct_answers: 1},
  {user_id: users[1].id, test_id: tests[2].id, correct_answers: 3},
  {user_id: users[2].id, test_id: tests[0].id, correct_answers: 2},
  {user_id: users[2].id, test_id: tests[1].id, correct_answers: 2},
  {user_id: users[3].id, test_id: tests[1].id, correct_answers: 1},
  {user_id: users[3].id, test_id: tests[2].id, correct_answers: 2},
  {user_id: users[4].id, test_id: tests[0].id, correct_answers: 3},
  {user_id: users[4].id, test_id: tests[1].id, correct_answers: 3},
  {user_id: users[4].id, test_id: tests[2].id, correct_answers: 2}])

#TestPassage.create!(test_passages)

