class CreateFiasCenterStatuses < ActiveRecord::Migration
  def change
    create_table :fias_center_statuses do |t|
      t.integer :centerstid
      t.string :name

      t.timestamps
    end
  end
end
