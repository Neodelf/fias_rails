class CreateFiasOperationStatuses < ActiveRecord::Migration
  def change
    create_table :fias_operation_statuses do |t|
      t.integer :operstatid
      t.string :name

      t.timestamps
    end
  end
end
