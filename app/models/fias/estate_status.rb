require "activerecord-import/base"
ActiveRecord::Import.require_adapter('postgis')
module Fias
  class EstateStatus < ActiveRecord::Base
    include Fias::Concerns::Uploadable
  end
end
