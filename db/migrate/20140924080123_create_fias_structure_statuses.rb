class CreateFiasStructureStatuses < ActiveRecord::Migration
  def change
    create_table :fias_structure_statuses do |t|
      t.integer :strstatid
      t.string :name
      t.string :shortname

      t.timestamps
    end
  end
end
