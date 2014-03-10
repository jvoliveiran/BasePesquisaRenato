class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.references :year
      t.references :discipline
      t.references :servant

      t.timestamps
    end
  end
end
