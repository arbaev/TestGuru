class RenameResultToTestPassage < ActiveRecord::Migration[5.2]
  def change
    rename_table :results, :test_passages
  end
end
