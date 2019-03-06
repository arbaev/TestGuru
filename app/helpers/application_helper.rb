module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def root_link
    link_to t('helpers.application.to_root'), root_path
  end

  def badges_link
    link_to t('helpers.application.to_badges'), badges_path
  end
end
