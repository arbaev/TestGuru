class User < ApplicationRecord
  def tests_by_level(level)
    results = Result.where(user_id: id).joins(:test).where('level = ?', level).includes(:test)
    results.to_a.reduce([]) { |acc, el| acc << el.test }
  end
end
