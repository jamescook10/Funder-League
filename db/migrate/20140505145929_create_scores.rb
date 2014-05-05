class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :player, index: true
      t.references :game, index: true
      t.string :value

      t.timestamps
    end
  end
end
