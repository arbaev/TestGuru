class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author
  has_many :questions
  has_many :results
  has_many :users, through: :results

  def self.by_category(cat)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
        .where(categories: { title: cat })
        .order(:title)
        .pluck(:title)
  end
end
