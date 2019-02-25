ruby = Category.create!(title: 'Ruby')
html = Category.create!(title: 'HTML')
css  = Category.create!(title: 'CSS')

tim = User.last
# tim = User.create!(name: 'Tim', email: 'tim@testguru.io', password: '123')
# zeus = User.create!(name: 'Zeus', email: 'zeus@testguru.io', password: '123')
# afina = User.create!(name: 'Afina', email: 'afina@testguru.io', password: '123')

tests = Test.create!(
  [
    { title: 'Ruby basics', level: 0, category: ruby, author: tim },
    { title: 'Ruby idioms', level: 1, category: ruby, author: tim },
    { title: 'Ruby advanced', level: 2, category: ruby, author: tim },
    { title: 'HTML Semantics', level: 0, category: html, author: tim },
    { title: 'HTML Forms', level: 0, category: html, author: tim },
    { title: 'HTML Canvas', level: 1, category: html, author: tim },
    { title: 'CSS Syntax', level: 0, category: css, author: tim },
    { title: 'CSS Flexbox', level: 0, category: css, author: tim },
    { title: 'CSS Grid', level: 1, category: css, author: tim }
  ]
)

QUESTIONS_NUMBER = 3
ANSWERS_NUMBER = 3

tests.each do |test|
  QUESTIONS_NUMBER.times do |i|
    quest = Question.create!(body: "#{test.title} question #{i}", test: test)
    ANSWERS_NUMBER.times do |j|
      correctness = j == 1
      Answer.create!(body: "It's a #{correctness} answer for #{test.title}!",
                     correct: correctness,
                     question: quest)
    end
  end
end

# users = [tim, zeus, afina]
# users.each do |user|
#   tests.sample(3).each do |test|
#     TestPassage.create(score: rand(1..3), test: test, user: user)
#   end
# end
