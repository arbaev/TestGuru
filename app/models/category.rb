class Category < ApplicationRecord
  has_many :tests, dependent: :restrict_with_exception

  default_scope { order(title: :asc) }
end
