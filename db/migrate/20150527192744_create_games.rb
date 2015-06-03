class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :query, null: false
      t.integer :score, null: false, default: 0

      t.timestamps null: false
    end
  end
end
