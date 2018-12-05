class CreateAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :attributes do |t|
      #角色名稱
      t.string      :name

      #角色的借錢能力
      t.integer     :rent_level

      #角色目前的前科等級
      t.integer     :is_criminal

      #角色目前的酒醉等級
      t.integer     :is_drunk

      #角色目前的疾病等級
      t.integer     :is_ill

      #角色目前的體力值
      t.integer     :hp

      #角色目前的資金
      t.integer     :money

      #角色的負責社工
      t.string      :guardian

      #角色是否達成1st任務
      t.boolean     :is_mission_1

      #角色是否達成2nd任務
      t.boolean     :is_mission_2

      #角色是否達成3rd任務
      t.boolean     :is_mission_3

      t.timestamps
    end
  end
end
