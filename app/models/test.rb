class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :difficulty, ->(difficulty) { public_send difficulty }

  scope :by_category, lambda { |cat|
    joins(:category)
      .where(categories: { title: cat })
      .order(title: :desc)
      .pluck(:title)
  }
end
