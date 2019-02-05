module TestsHelper
  def test_level(test)
    test_levels = {0 => I18n.t('helpers.test.easy'),
                   1 => I18n.t('helpers.test.elementary'),
                   2 => I18n.t('helpers.test.advanced'),
                   3 => I18n.t('helpers.test.hard')}
    test_levels[test.level] || I18n.t('helpers.test.pro')
  end
end
