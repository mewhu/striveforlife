class ChangeIsMission2ToMission2 < ActiveRecord::Migration[5.1]
  def change
    rename_column :endgrades, :is_mission_2,  :mission_2
    change_column :endgrades, :mission_2,   :string
  end
end
