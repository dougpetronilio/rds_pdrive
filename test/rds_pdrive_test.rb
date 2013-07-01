require 'test/unit'
require 'rds_pdrive'

module RdsPdrive
  class RdsPdriveTest < Test::Unit::TestCase
    def test_module
      assert_not_nil RdsPdrive::VERSION
    end
  end
end