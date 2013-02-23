class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :logo
      t.integer :attack
      t.integer :middle
      t.integer :defense
      t.float :score

      t.timestamps
    end
  end
end
