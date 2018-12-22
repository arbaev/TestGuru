class SetDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:tests, :level, from: nil, to: 0)
    change_column_default(:answers, :correct, false)
  end
end
