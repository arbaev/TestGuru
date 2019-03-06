# frozen_string_literal: true

class Test < ApplicationRecord
  LEVELS = %i[easy elementary advanced hard pro].freeze

  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, :duration, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_create :set_duration_in_seconds

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :tests_by_category, lambda { |cat|
    joins(:category)
      .where(categories: { title: cat })
      .order(title: :desc)
  }

  def self.by_category(category)
    tests_by_category(category).pluck(:title)
  end

  def total_questions
    questions.size
  end

  private

  def set_duration_in_seconds
    self.duration = duration * 60
  end
end
