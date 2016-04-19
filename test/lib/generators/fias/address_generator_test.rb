require 'test_helper'
require 'generators/address/address_generator'

module Fias
  class AddressGeneratorTest < Rails::Generators::TestCase
    tests AddressGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    # test "generator runs without errors" do
    #   assert_nothing_raised do
    #     run_generator ["arguments"]
    #   end
    # end
  end
end
