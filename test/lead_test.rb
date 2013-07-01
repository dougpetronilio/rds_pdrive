require 'test/unit'
require 'rds_pdrive'

module RdsPdrive
  class LeadTest < Test::Unit::TestCase
    def test_add_new_lead
      lead = Lead.new("Douglas", "Petronilio", "dougpetronilio@gmail.com", "Resultados Digitais", "4899469912")
      assert_equal("Douglas", lead.name)
    end
  end  
end
