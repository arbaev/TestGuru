module Admin::GistHelper
  def gist_id(gist_url)
    gist_url.split('/').last
  end
end
