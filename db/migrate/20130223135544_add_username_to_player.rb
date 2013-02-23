class AddUsernameToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :username, :string
    add_column :players, :name, :string
  end
end
