class AddSurveyidToEndgrade < ActiveRecord::Migration[5.1]
  def change
    add_column :endgrades, :survey_id, :integer
  end
end
