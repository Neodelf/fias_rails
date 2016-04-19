class CreateFiasIntervalStatuses < ActiveRecord::Migration
  def change
    create_table :fias_interval_statuses do |t|
      t.integer :intvstatid
      t.string :name

      t.timestamps
    end
  end
end
