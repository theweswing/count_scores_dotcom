class AddEmailToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :email, :string
  end
end
