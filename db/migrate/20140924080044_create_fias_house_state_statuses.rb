class CreateFiasHouseStateStatuses < ActiveRecord::Migration
  def change
    create_table :fias_house_state_statuses do |t|
      t.integer :housestid
      t.string :name

      t.timestamps
    end
  end
end
