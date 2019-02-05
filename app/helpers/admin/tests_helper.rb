module Admin::TestsHelper
  def link_to_tests
    link_to t('helpers.admin.test.back2tests'), admin_tests_path
  end

  def link_new_question
    link_to t('helpers.admin.test.new_question'), new_admin_test_question_path(@test)
  end

  def link_new_test
    link_to t('helpers.admin.test.new_test'), new_admin_test_path
  end
end
