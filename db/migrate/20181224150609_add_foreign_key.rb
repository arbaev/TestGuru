class AddForeignKey < ActiveRecord::Migration[5.2]
  def up
    change_table :tests do |t|
      t.bigint :category_id
    end
    add_foreign_key :tests, :categories

    change_table :questions do |t|
      t.bigint :test_id
    end
    add_foreign_key :questions, :tests

    change_table :results do |t|
      t.bigint :test_id
      t.bigint :user_id
    end
    add_foreign_key :results, :tests
    add_foreign_key :results, :users
  end

  def down
    remove_foreign_key :tests, :categories
    change_table :tests do |t|
      t.remove :category_id
    end

    remove_foreign_key :questions, :tests
    change_table :questions do |t|
      t.remove :test_id
    end

    remove_foreign_key :results, :tests
    remove_foreign_key :results, :users
    change_table :results do |t|
      t.remove :test_id
      t.remove :user_id
    end
  end
end
