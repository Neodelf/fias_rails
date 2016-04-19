module Fias
  class OperationStatus < ActiveRecord::Base
    include Fias::Concerns::Uploadable
  end
end
