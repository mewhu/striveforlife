class AddNumberOfPlayersToSurveys < ActiveRecord::Migration[5.1]
  def change
    add_column  :surveys, :number_of_players, :integer
  end
end
