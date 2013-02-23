class CreateRankings < ActiveRecord::Migration
  
  def change
    create_table :rankings do |t|
      t.references :league
      t.references :player
      t.integer :position

      t.timestamps
    end

    add_index :rankings, :league_id
    add_index :rankings, :player_id
    add_index :rankings, :position
  end

end