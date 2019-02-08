class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  GITHUB_GIST_URL = 'https://gist.github.com/'

  def truncated(text, length = 25)
    text.truncate(length, omission: "…")
  end
end
