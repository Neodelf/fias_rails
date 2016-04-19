module Fias
  class CurrentStatus < ActiveRecord::Base
    include Fias::Concerns::Uploadable
  end
end
