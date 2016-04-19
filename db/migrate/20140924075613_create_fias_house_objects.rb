class CreateFiasHouseObjects < ActiveRecord::Migration
  def change
    create_table :fias_house_objects do |t|
      t.string :houseid
      t.string :aoguid
      t.string :buildnum
      t.integer :counter
      t.date :enddate
      t.integer :eststatus
      t.string :houseguid
      t.string :housenum
      t.string :ifnsfl
      t.string :ifnsul
      t.string :normdoc
      t.string :okato
      t.string :oktmo
      t.string :postalcode
      t.date :startdate
      t.integer :statstatus
      t.integer :strstatus
      t.string :strucnum
      t.string :terrifnsfl
      t.string :terrifnsul
      t.datetime :updatedate

      t.timestamps
    end
    add_index(:fias_house_objects, :houseid, :unique => true)
    add_index(:fias_house_objects, :aoguid)
    add_index(:fias_house_objects, :houseguid)
  end
end
