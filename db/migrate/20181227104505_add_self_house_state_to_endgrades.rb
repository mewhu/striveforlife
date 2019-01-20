class AddSelfHouseStateToEndgrades < ActiveRecord::Migration[5.1]
  def change
    add_column  :endgrades, :self_house_state, :boolean
  end
end
