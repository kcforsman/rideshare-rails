class AddDriverStatusToDrivers < ActiveRecord::Migration[5.1]
  def change
    add_column :drivers, :driver_status, :string
  end
end
