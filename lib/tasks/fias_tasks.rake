require 'nokogiri'

class ObjectHash < Nokogiri::XML::SAX::Document
  attr_accessor :object_saver, :object, :count, :created, :all_count

  def initialize
    @count = 0
    @created = 0
    @objects = []
    @import_count = 4000
  end

  def start_element(name, attrs)
    if @object == name
      params = {}
      attrs.each { |attr|
        params[attr[0].downcase.to_sym] = attr[1]
      }
      @objects << params
      @count+=1
      if @count % @import_count == 0
        @created+= (@object_saver.call @objects)
        @objects = []
        p "#{Time.now} | #{@object} : #{report}"
      end
    end
  end

  def end_document
    if @count < @import_count
      @created+= (@object_saver.call @objects)
      @objects = []
      p "#{Time.now} | #{@object} : #{report}"
    end
  end

  def report
    "objects loaded: #{count.to_s}, Created: #{created.to_s}"
  end
end

namespace :fias do
  desc 'Fias loading'

  def process(prefix, object)
    dir = "#{Rails.root}/files/fias/upload/"
    Dir.foreach(dir) { |file|
      if (file.start_with? prefix)
        parser = Nokogiri::XML::SAX::Parser.new(object)
        parser.parse(File.open(dir + file))
      end
    }
  end

  def upload_task(klass, file_name, object_name=nil)
    klass.delete_all
    object = ObjectHash.new
    object.object = object_name.present? ? object_name : klass.to_s[6,klass.to_s.length]
    object.object_saver = Proc.new { |arr| klass.batch_upload(arr) }

    process file_name, object
    p "#{object.object} " + object.report
  end

  task :clear => :environment  do
    [Fias::AddressObject, Fias::HouseObject, Fias::EstateStatus, Fias::AddressObjectType, Fias::CurrentStatus, Fias::ActualStatus,
     Fias::OperationStatus, Fias::CenterStatus, Fias::IntervalStatus, Fias::HouseStateStatus, Fias::StructureStatus].each { |model| model.delete_all}
    p 'Tables was cleared'
  end

  namespace :upload do
    desc 'Fias addresses initial loading'
    task :addresses => :environment do
      upload_task(Fias::AddressObject, 'AS_ADDROBJ_', 'Object')
    end

    desc 'Fias houses initial loading'
    task :houses => :environment do
      upload_task(Fias::HouseObject, 'AS_HOUSE_', 'House')
    end

    desc 'Fias directories initial loading'
    task :directories => :environment do
      [ [Fias::EstateStatus, 'AS_ESTSTAT_'],
        [Fias::AddressObjectType, 'AS_SOCRBASE_'],
        [Fias::CurrentStatus, 'AS_CURENTST_'],
        [Fias::ActualStatus, 'AS_ACTSTAT_'],
        [Fias::OperationStatus, 'AS_OPERSTAT_'],
        [Fias::CenterStatus, 'AS_CENTERST_'],
        [Fias::IntervalStatus, 'AS_INTVSTAT_'],
        [Fias::HouseStateStatus, 'AS_HSTSTAT_'],
        [Fias::StructureStatus, 'AS_STRSTAT_']
      ].each { |directory| upload_task(directory[0], directory[1]) }
    end

    desc 'Fias estate status initial loading'
    task :estate_statuses => :environment do
      upload_task(Fias::EstateStatus, 'AS_ESTSTAT_')
    end

    desc 'Fias address object types status initial loading'
    task :address_object_types => :environment do
      upload_task(AddressObjectType, 'AS_SOCRBASE_')
    end

    desc 'Fias current status initial loading'
    task :current_statuses => :environment do
      upload_task(CurrentStatus, 'AS_CURENTST_')
    end

    desc 'Fias actual status initial loading'
    task :actual_statuses => :environment do
      upload_task(ActualStatus, 'AS_ACTSTAT_')
    end

    desc 'Fias operation status initial loading'
    task :operation_statuses => :environment do
      upload_task(OperationStatus, 'AS_OPERSTAT_')
    end

    desc 'Fias center status initial loading'
    task :center_statuses => :environment do
      upload_task(CenterStatus, 'AS_CENTERST_')
    end

    desc 'Fias interval status initial loading'
    task :interval_statuses => :environment do
      upload_task(IntervalStatus, 'AS_INTVSTAT_')
    end

    desc 'Fias house state status initial loading'
    task :house_state_statuses => :environment do
      upload_task(HouseStateStatus, 'AS_HSTSTAT_')
    end

    desc 'Fias structure status initial loading'
    task :structure_statuses => :environment do
      upload_task(StructureStatus, 'AS_STRSTAT_')
    end
  end

  namespace :update do
    desc 'Fias addresses update'
    task :addresses => :environment do
      object = ObjectHash.new
      object.object='Object'
      object.object_saver=Proc.new { |arr| Fias::AddressObject.batch_update(arr, :aoid) }

      process 'AS_ADDROBJ_', object
      p 'Address ' + object.report
    end

    desc 'Fias houses update'
    task :houses => :environment do
      object = ObjectHash.new
      object.object='House'
      object.object_saver=Proc.new { |arr| Fias::HouseObject.batch_update(arr, :houseid) }

      process 'AS_HOUSE_', object
      p 'Houses ' + object.report
    end
  end

end
