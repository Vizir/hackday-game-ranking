class AddPictureUrlToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :pictureUrl, :string
  end
end
