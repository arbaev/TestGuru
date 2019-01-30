class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  devise :database_authenticatable, :validatable, password_length: 3..128

  before_save :before_save_email_downcase

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :authorships, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify

  validates :name, presence: true
  validates :email, format: { with: /.+@.+\..+/i },
                    uniqueness: true

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  private

  def before_save_email_downcase
    self.email = email.downcase
  end
end
