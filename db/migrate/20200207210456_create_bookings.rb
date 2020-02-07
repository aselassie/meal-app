class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :start
      t.string :end
      t.references :user, foreign_key: true
      t.references :meal, foreign_key: true

      t.timestamps
    end
  end
end
