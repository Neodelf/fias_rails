class CreateFiasActualStatuses < ActiveRecord::Migration
  def change
    create_table :fias_actual_statuses do |t|
      t.integer :actstatid
      t.string :name

      t.timestamps
    end
  end
end
