class CreateFiasAddressObjects < ActiveRecord::Migration
  def change
    create_table :fias_address_objects do |t|
      t.string :aoid
      t.integer :actstatus
      t.string :aoguid
      t.integer :aolevel
      t.string :areacode
      t.string :autocode
      t.integer :centstatus
      t.string :citycode
      t.string :code
      t.string :ctarcode
      t.integer :currstatus
      t.date :enddate
      t.string :extrcode
      t.string :formalname
      t.string :ifnsfl
      t.string :ifnsul
      t.string :livestatus
      t.string :nextid
      t.string :normdoc
      t.string :offname
      t.string :okato
      t.string :oktmo
      t.integer :operstatus
      t.string :parentguid
      t.string :placecode
      t.string :plaincode
      t.string :postalcode
      t.string :previd
      t.string :regioncode
      t.string :sextcode
      t.string :shortname
      t.date :startdate
      t.string :streetcode
      t.string :terrifnsfl
      t.string :terrifnsul
      t.date :updatedate

      t.timestamps
    end
    add_index(:fias_address_objects, :aoid, :unique => true)
    add_index(:fias_address_objects, :aoguid)
    add_index(:fias_address_objects, :parentguid)
  end
end
