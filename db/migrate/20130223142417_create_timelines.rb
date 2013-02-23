class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.string :message
      t.references :league
      t.references :game

      t.timestamps
    end
  end
end
