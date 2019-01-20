class AddPlayersModeToEndgrades < ActiveRecord::Migration[5.1]
  def change
    add_column  :endgrades, :players_mode,  :string
  end
end
