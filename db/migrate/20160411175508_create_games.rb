class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.text :summary
      t.string :gameLink

      t.timestamps null: false
    end
  end
end
