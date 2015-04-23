class AddWageToServants < ActiveRecord::Migration
  def change
    add_column :servants, :wage, :integer
  end
end
