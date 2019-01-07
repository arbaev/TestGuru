ruby = Category.create!(title: 'Ruby')
html = Category.create!(title: 'HTML')
css = Category.create!(title: 'CSS')

user_names = %w[Tim Zeus Afina]
users = user_names.reduce([]) { |acc, name| acc << User.create!(name: name) }

tests = Test.create!([{ title: 'Ruby basics', level: 0, category_id: ruby.id },
                      { title: 'Ruby idioms', level: 1, category_id: ruby.id },
                      { title: 'Ruby advanced', level: 2, category_id: ruby.id },
                      { title: 'HTML Semantics', level: 0, category_id: html.id },
                      { title: 'HTML Forms', level: 0, category_id: html.id },
                      { title: 'HTML Canvas', level: 1, category_id: html.id },
                      { title: 'CSS Syntax', level: 0, category_id: css.id },
                      { title: 'CSS Flexbox', level: 0, category_id: css.id },
                      { title: 'CSS Grid', level: 1, category_id: css.id }])

QUESTIONS_NUMBER = 3
ANSWERS_NUMBER = 3

tests.each do |test|
  QUESTIONS_NUMBER.times do |i|
    quest = Question.create!(body: "#{test.title} question #{i}", test_id: test.id)
    ANSWERS_NUMBER.times do |j|
      correctness = j == 1
      Answer.create!(body: "It's a #{correctness} answer for #{test.title}!",
                    correct: correctness,
                    question_id: quest.id)
    end
  end
end

users.each do |user|
  tests.sample(3).each do |test|
    Result.create(score: rand(1..3), test_id: test.id, user_id: user.id)
  end
end
