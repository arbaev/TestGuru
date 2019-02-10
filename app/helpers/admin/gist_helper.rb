module Admin::GistHelper
  def truncated(text, length = 25)
    text.truncate(length, omission: "…")
  end

  def gist_id(gist_url)
    gist_url.split('/').last
  end
end
