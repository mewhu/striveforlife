class AddEndingnumberToEndgrades < ActiveRecord::Migration[5.1]
  def change
    add_column  :endgrades, :ending_number, :integer
  end
end
