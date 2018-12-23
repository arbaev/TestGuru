CATEGORIES = %w[Ruby Rails SQL HTML CSS Bootstrap].freeze
USERS = %w[Tim Zeus Afina].freeze

CATEGORIES.each do |el|
  Category.create(title: el)
end

USERS.each do |el|
  User.create(name: el)
end

TESTS = [
  { title: 'Ruby basics', level: 0, category_id: Category.find_by(title: 'Ruby').id },
  { title: 'Ruby idioms', level: 1, category_id: Category.find_by(title: 'Ruby').id },
  { title: 'Ruby advanced', level: 2, category_id: Category.find_by(title: 'Ruby').id },
  { title: 'Rails basics', level: 0, category_id: Category.find_by(title: 'Rails').id },
  { title: 'Rails pro', level: 2, category_id: Category.find_by(title: 'Rails').id },
  { title: 'SQL basics', level: 0, category_id: Category.find_by(title: 'SQL').id },
  { title: 'HTML Semantics', level: 0, category_id: Category.find_by(title: 'HTML').id },
  { title: 'HTML Forms', level: 0, category_id: Category.find_by(title: 'HTML').id },
  { title: 'HTML Canvas', level: 1, category_id: Category.find_by(title: 'HTML').id },
  { title: 'CSS Syntax', level: 0, category_id: Category.find_by(title: 'CSS').id },
  { title: 'CSS Flexbox', level: 0, category_id: Category.find_by(title: 'CSS').id },
  { title: 'CSS Grid', level: 1, category_id: Category.find_by(title: 'CSS').id },
  { title: 'Bootstrap Grid', level: 0, category_id: Category.find_by(title: 'Bootstrap').id },
  { title: 'Bootstrap 4 features', level: 1, category_id: Category.find_by(title: 'Bootstrap').id },
  { title: 'Bootstrap theming', level: 2, category_id: Category.find_by(title: 'Bootstrap').id }
].freeze

TESTS.each do |el|
  Test.create(el)
end

Test.find_each(batch_size: 1) do |test|
  5.times do |i|
    question = Question.create(body: "#{test.title} question #{i}", test_id: test.id)

    correctness = i == 1
    Answer.create(body: "It's a #{correctness} answer for #{test.title}!",
                  correct: correctness,
                  question_id: question.id)
  end
end

User.find_each(batch_size: 1) do |user|
  tests = Test.order("RANDOM()").limit(3)

  tests.each do |test|
    Result.create(score: rand(1..5), test_id: test.id, user_id: user.id)
  end
end
