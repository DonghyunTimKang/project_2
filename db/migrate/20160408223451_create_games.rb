class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.text :summary
      t.integer :content

      t.timestamps null: false
    end
  end
end
