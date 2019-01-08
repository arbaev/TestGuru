class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :restrict_with_exception
  has_many :users, through: :results, dependent: :restrict_with_exception

  def self.by_category(cat)
    joins(:category)
      .where(categories: { title: cat })
      .order(title: :desc)
      .pluck(:title)
  end
end
