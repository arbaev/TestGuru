module TestsHelper
  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze
  def test_level(test)
    TEST_LEVELS[test.level] || :pro
  end

  def test_nav(test)
    to_test = link_to 'Back to test', test_path(test)
    to_all_tests = link_to 'Back to all tests', tests_path
    to_test + ' | ' + to_all_tests
  end
end
