module Admin::NavigationHelper
  def link_to_tests
    link_to t('helpers.admin.navigation.back2tests'), admin_tests_path
  end

  def link_new_question
    link_to t('helpers.admin.navigation.new_question'), new_admin_test_question_path(@test)
  end

  def link_new_test
    link_to t('helpers.admin.navigation.new_test'), new_admin_test_path
  end

  def link_to_gists
    link_to t('helpers.admin.navigation.gists'), admin_gists_path
  end

end
