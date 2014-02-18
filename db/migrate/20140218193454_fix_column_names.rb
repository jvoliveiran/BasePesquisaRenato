class FixColumnNames < ActiveRecord::Migration
  def change
    change_table :books do |t|
      t.rename :year, :yearbook
    end
  end
end
