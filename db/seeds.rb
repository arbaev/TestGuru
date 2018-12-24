ruby = Category.create!(title: 'Ruby')
html = Category.create!(title: 'HTML')
css = Category.create!(title: 'CSS')

USERS = %w[Tim Zeus Afina].freeze
USERS.each do |el|
  User.create!(name: el)
end

Test.create!([{ title: 'Ruby basics', level: 0, category_id: ruby.id },
              { title: 'Ruby idioms', level: 1, category_id: ruby.id },
              { title: 'Ruby advanced', level: 2, category_id: ruby.id },
              { title: 'HTML Semantics', level: 0, category_id: html.id },
              { title: 'HTML Forms', level: 0, category_id: html.id },
              { title: 'HTML Canvas', level: 1, category_id: html.id },
              { title: 'CSS Syntax', level: 0, category_id: css.id },
              { title: 'CSS Flexbox', level: 0, category_id: css.id },
              { title: 'CSS Grid', level: 1, category_id: css.id }])

Test.find_each(batch_size: 1) do |test|
  3.times do |i|
    Question.create!(body: "#{test.title} question #{i}", test_id: test.id)

    correctness = i == 1
    Answer.create!(body: "It's a #{correctness} answer for #{test.title}!",
                   correct: correctness)
  end
end

User.find_each(batch_size: 1) do |user|
  tests = Test.order("RANDOM()").limit(3)

  tests.each do |test|
    Result.create(score: rand(1..5), test_id: test.id, user_id: user.id)
  end
end
