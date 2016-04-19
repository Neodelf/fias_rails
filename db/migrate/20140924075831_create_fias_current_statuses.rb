class CreateFiasCurrentStatuses < ActiveRecord::Migration
  def change
    create_table :fias_current_statuses do |t|
      t.integer :curentstid
      t.string :name

      t.timestamps
    end
  end
end
