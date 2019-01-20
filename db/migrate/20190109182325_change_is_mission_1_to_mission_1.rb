class ChangeIsMission1ToMission1 < ActiveRecord::Migration[5.1]
  def change
    rename_column :endgrades, :is_mission_1,  :mission_1
    change_column :endgrades, :mission_1,   :string
  end
end
