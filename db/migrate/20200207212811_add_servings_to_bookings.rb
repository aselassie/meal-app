class AddServingsToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :servings, :integer
  end
end
