class CreateDisciplineServants < ActiveRecord::Migration
  def change
    create_table :discipline_servants do |t|
      t.references :discipline
      t.references :servant

      t.index [:discipline_id, :servant_id], unique:true

      t.timestamps
    end
  end
end
