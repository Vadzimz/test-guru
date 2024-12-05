class User < ApplicationRecord
  
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: "Test", foreign_key: "author_id", inverse_of: :author

  validates :email, presence: true

  #Создайте инстанс-метод в модели User, который принимает в качестве аргумента значение уровня сложности и возвращает список всех Тестов, 
  #которые проходит или когда-либо проходил Пользователь на этом уровне сложности

  def tests_list_by_level(level)
    
    #with join
    #TestPassage.joins(:user, :test).where(test: {level: level}, user: {id: self.id}).pluck(:title)
    
    #with association
    self.tests.where(level: level).pluck(:title)
  end

end
