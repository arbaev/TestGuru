class UserBadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def give_badges
    badges = Badge.all
    badges.map do |badge|
      @user.badges.push(badge) if send(badge.criterion.to_sym, badge.param.to_i)
    end
  end

  private

  def all_level(level_id)
    level_tests_ids = Test.where(level: level_id).ids
    (level_tests_ids - @user.tests.ids).empty?
  end

  def all_category(category_id)
    cat_tests_ids = Category.find(category_id).tests.ids
    (cat_tests_ids - @user.tests.ids).empty?
  end

  def first_try(test_id)
    test_id == @test.id && not_passed_before?(@test)
  end

  def not_passed_before?(test)
    @user.test_passages.where(test: test).count == 1
  end
end
