module Fias
  class ActualStatus < ActiveRecord::Base
    include Fias::Concerns::Uploadable
  end
end
