module Fias
  class AddressObjectType < ActiveRecord::Base
    include Fias::Concerns::Uploadable
  end
end
