class Test < ApplicationRecord
  def self.by_category(cat)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
        .where(categories: { title: cat })
        .order(:title)
        .pluck(:title)
  end
end
