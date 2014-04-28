class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :game_type, index: true
      t.references :winner, index: true

      t.timestamps
    end
  end
end
