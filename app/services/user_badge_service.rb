class UserBadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def give_badges
    return unless @test_passage.successful?

    badges = Badge.all
    badges.select do |badge|
      send("#{badge.criterion}?".to_sym, badge.param)
    end
  end

  private

  def all_level?(level_id)
    if @test.level == level_id.to_i
      level_tests_ids = Test.where(level: level_id.to_i).ids
      (level_tests_ids - user_tests_successful.ids).empty?
    end
  end

  def all_category?(category_id)
    if @test.category.id == category_id.to_i
      cat_tests_ids = Category.find(category_id.to_i).tests.ids
      (cat_tests_ids - user_tests_successful.ids).empty?
    end
  end

  def first_try?(test_id)
    return not_passed_before?(@test) if test_id.to_i == 0

    test_id.to_i == @test.id && not_passed_before?(@test)
  end

  def not_passed_before?(test)
    @user.test_passages.where(test: test).count == 1
  end

  def user_tests_successful
    @user.test_passages.select(&:successful?)
  end
end
