class AddJobToEndgrades < ActiveRecord::Migration[5.1]
  def change
    add_column :endgrades, :job, :string
  end
end
