class AddColorToGameType < ActiveRecord::Migration
  def change
    add_column :game_types, :color, :string
  end
end
