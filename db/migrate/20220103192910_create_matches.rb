class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.integer :game_id
      t.string :date
      t.timestamps
    end
  end
end
