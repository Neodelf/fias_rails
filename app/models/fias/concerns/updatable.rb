require 'activerecord-import/base'
ActiveRecord::Import.require_adapter('postgis')
module Fias::Concerns::Updatable
  extend ActiveSupport::Concern

  module ClassMethods
    def batch_update(attrs, field)
      created = 0
      self.transaction do
        addresses = []
        exists = Set.new(self.where(aoid: attrs.collect { |h| h[field] }).pluck(field))
        #exists = Set.new(self.where("#{field.to_s} = ?", attrs.collect { |h| h[field] }).pluck(field))
        attrs.each { |hash|
          unless exists.include? hash[field]
            addresses << self.new(hash)
            created+=1
          else
            self.where("#{field.to_s} = ?", hash[field]).update_all(hash)
          end
        }
        self.import addresses, {:validate => false}
      end
      created
    end
  end
end
