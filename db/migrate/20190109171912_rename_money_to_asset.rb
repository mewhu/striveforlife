class RenameMoneyToAsset < ActiveRecord::Migration[5.1]
  def change
    rename_column :endgrades, :money, :asset
  end
end
