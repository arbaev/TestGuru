module Admin::GistHelper
  def truncated(text, length = 25)
    text.truncate(length, omission: "…")
  end
end
