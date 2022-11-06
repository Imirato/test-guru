# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create(first_name: 'Anna', last_name: 'Smirnova', email: 'anna@gmail.com',
                     password: '123456', password_confirmation: '123456', type: 'Admin')
user_1.confirm
user_2 = User.create(first_name: 'Sasha', last_name: 'Ivanov', email: 'sasha@yandex.ru',
                     password: '654321', password_confirmation: '654321')
user_2.confirm

category_1 = Category.create(title: 'Основы Ruby')
category_2 = Category.create(title: 'Основы HTML5')

test_1 = Test.create(title: 'Основы Ruby. Начальный уровень', level: 0, category_id: category_1.id, author_id: user_1.id,
                     visibility_status: true)
test_2 = Test.create(title: 'Основы HTML5. Начальный уровень', level: 1, category_id: category_2.id, author_id: user_1.id,
                     visibility_status: false)

question_1 = Question.create(body: 'Как называется самый популярный фреймворк языка Ruby для веба?', test_id: test_1.id)
question_2 = Question.create(body: 'Чем отличается puts от print?', test_id: test_1.id)
question_3 = Question.create(body: 'Для чего используется тег pre?', test_id: test_2.id)
question_4 = Question.create(body: 'Какой тег не существует в HTML?', test_id: test_2.id)

answer_1 = Answer.create(body: 'Ruby Web', question_id: question_1.id)
answer_2 = Answer.create(body: 'RoR', correct: true, question_id: question_1.id)
answer_3 = Answer.create(body: 'Ничем, оба делают одно и тоже', question_id: question_2.id)
answer_4 = Answer.create(body: 'print без пропуска строки, а puts с пропуском', correct: true, question_id: question_2.id)
answer_5 = Answer.create(body: 'Используется для вывода аббревиатуры', question_id: question_3.id)
answer_6 = Answer.create(body: 'Используется для вывода программного кода', correct: true, question_id: question_3.id)
answer_7 = Answer.create(body: 'mark', question_id: question_4.id)
answer_8 = Answer.create(body: 'navigation', correct: true, question_id: question_4.id)
