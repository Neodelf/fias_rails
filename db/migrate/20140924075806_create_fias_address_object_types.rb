class CreateFiasAddressObjectTypes < ActiveRecord::Migration
  def change
    create_table :fias_address_object_types do |t|
      t.integer :level
      t.string :scname
      t.string :socrname
      t.string :kod_t_st

      t.timestamps
    end
  end
end
