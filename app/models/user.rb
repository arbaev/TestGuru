class User < ApplicationRecord
  has_many :results, dependent: :restrict_with_exception
  has_many :tests, through: :results, dependent: :restrict_with_exception
  has_many :authorship, class_name: "Test", foreign_key: "author_id", dependent: :nullify

  def tests_by_level(level)
    tests.where(level: level)
  end
end
