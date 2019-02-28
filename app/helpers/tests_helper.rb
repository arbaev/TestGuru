module TestsHelper
  def levels
    {0 => I18n.t('helpers.test.easy'),
     1 => I18n.t('helpers.test.elementary'),
     2 => I18n.t('helpers.test.advanced'),
     3 => I18n.t('helpers.test.hard'),
     4 => I18n.t('helpers.test.pro')}
  end

  def test_level(test)
    levels[test.level] || I18n.t('helpers.test.pro')
  end
end
