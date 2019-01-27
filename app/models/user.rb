class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :authorship, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify

  has_secure_password

  validates :name, presence: true
  validates :email, format: { with: /.+@.+\..+/i },
                    uniqueness: true

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
