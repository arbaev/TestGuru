class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  has_many :authorship, class_name: "Test", foreign_key: "author_id", dependent: :nullify

  validates :name, :email, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end
end
