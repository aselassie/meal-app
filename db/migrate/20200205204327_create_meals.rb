class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.string :category
      t.decimal :price
      t.string :city
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
