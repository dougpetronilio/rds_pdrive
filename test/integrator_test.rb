require 'test/unit'
require 'rds_pdrive'

module RdsPdrive
  class IntegratorTest < Test::Unit::TestCase
    def setup
        @integrator = Integrator.new("dougpetronilio@gmail.com", "testeapirdspipedrive")
    end
    
    def test_authorization
      assert_equal "264af15c36a2bfa50ceb21ae1734e6f0f3527788", @integrator.token
    end
    
    def test_get_all_leads
      @integrator.get_all_leads
      assert_equal "Teste1", @integrator.leads[0].name
    end
    
    def test_add_new_lead
      lead = Lead.new("Teste", "", "teste@teste.com.br", "Res", "99234512")
      @integrator.add_lead(lead)
      assert_not_nil @integrator.find_by_name(lead.name)
    end
  end
end