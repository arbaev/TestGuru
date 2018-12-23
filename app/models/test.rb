class Test < ApplicationRecord
  belongs_to :category

  def self.titles_by_category(category)
    cat_id = Category.find_by(title: category).id
    tests_selected = Test.where(category_id: cat_id).order(title: :asc)
    tests_selected.reduce([]) { |acc, test| acc << test.title }
  end
end
