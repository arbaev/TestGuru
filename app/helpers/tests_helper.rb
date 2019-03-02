module TestsHelper
  def levels
    Test.levels.map { |k, i| [i, I18n.t("helpers.test.#{k}")] }.to_h
  end

  def test_level(test)
    levels[test.level] || I18n.t('helpers.test.pro')
  end
end
