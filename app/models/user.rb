class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy

  has_many :authorships, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify

  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  validates :name, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end
end
