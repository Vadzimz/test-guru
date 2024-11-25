# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

%w(Javascript  SQL  Java  Ruby).each {|cat| Category.find_or_create_by!(title: cat)}

users = [
    {name: "Brenda", surname: "Nazario", email: "BrendaMNazario@rhyta.com"},
    {name: "Zara", surname: "Rose", email: "ZaraRose@jourrapide.com"},
    {name: "Corey", surname: "Warren", email: "CoreyWarren@armyspy.com"},
    {name: "Madeleine", surname: "Hamilton", email: "MadeleineHamilton@armyspy.com"},
    {name: "Lewis", surname: "Potts", email: "LewisPotts@rhyta.com"}]

User.create!(users)

tests = [
        {title: "Javascript test", level: 1, category_id: 1}, 
        {title: "SQL basics", category_id: 2}, 
        {title: "Java test", level: 1, category_id: 3}]

Test.create!(tests)

questions = [
        {body: "Which function is used to serialize an object into a JSON string in Javascript?", test_id: 1},
        {body: "Which object in Javascript doesn’t have a prototype?", test_id: 1},
        {body: "What command is used to create a new table in SQL?", test_id: 2},
        {body: "Automatic type conversion is possible in which of the possible cases?", test_id: 3},
        {body: "Identify the Microsoft solution for providing dynamic web content", test_id: 3}]

Question.create!(questions)        

Answer.create!([
        {body: "stringify()", correct: true, question_id: 1},
        {body: "parse()", question_id: 1},
        {body: "convert()", question_id: 1},
        {body: "None of the above", question_id: 1},
        {body: "Base Object", correct: true, question_id: 2},
        {body: "All objects have a prototype",  question_id: 2},
        {body: "None of the objects have a prototype", question_id: 2},
        {body: "None of the above", question_id: 2},
        {body: "CREATE TABLE", correct: true, question_id: 3},
        {body: "BUILD TABLE", question_id: 3},
        {body: "GENERATE TABLE", question_id: 3},
        {body: "None of the above", question_id: 3},
        {body: "Byte to int", question_id: 4},
        {body: "Int to long", correct: true, question_id: 4},
        {body: "Long to int", question_id: 4},
        {body: "Short to int", question_id: 4},
        {body: "ASP", question_id: 5},
        {body: "JSP", correct: true, question_id: 5},
        {body: "Both A and B", question_id: 5},
        {body: "None of the above", question_id: 5}])

#Answer.create!(answers)
