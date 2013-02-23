class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player1_id
      t.integer :player1_score
      t.integer :player1_team_id
      t.integer :player2_id
      t.integer :player2_score
      t.integer :player2_team_id
      t.boolean :exhibition
      t.references :league

      t.timestamps
    end
    add_index :games, :league_id
  end
end
