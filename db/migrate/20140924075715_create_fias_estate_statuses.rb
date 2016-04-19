class CreateFiasEstateStatuses < ActiveRecord::Migration
  def change
    create_table :fias_estate_statuses do |t|
      t.integer :eststatid
      t.string :name

      t.timestamps
    end
  end
end
