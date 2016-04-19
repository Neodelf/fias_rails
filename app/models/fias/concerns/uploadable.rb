require 'activerecord-import/base'
ActiveRecord::Import.require_adapter('postgis')
module Fias::Concerns::Uploadable
  extend ActiveSupport::Concern

  module ClassMethods
    def batch_upload(attrs)
      array = []
      attrs.each { |hash| array << self.new(hash) }
      self.import array, {:validate => false}
      attrs.count
    end
  end
end
