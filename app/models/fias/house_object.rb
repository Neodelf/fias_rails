require "activerecord-import/base"
ActiveRecord::Import.require_adapter('postgis')
module Fias
  class HouseObject < ActiveRecord::Base
    include Fias::Concerns::Uploadable
    #include Fias::Concerns::Updatable

    def self.batch_update(attrs, field)
      created = 0
      self.transaction do
        houses = []
        exists = Set.new(self.where(houseid: attrs.collect { |h| h[field] }).pluck(field))
        attrs.each { |hash|
          unless exists.include? hash[field]
            houses << self.new(hash)
            created+=1
          else
            self.where(houseid: hash[:houseid]).update_all(hash)
          end
        }
        self.import houses, {:validate => false}
      end
      created
    end
  end
end
