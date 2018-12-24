class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins('JOIN results ON results.test_id = tests.id')
        .where("tests.level = ? AND results.user_id = ?", level, id)
  end
end
