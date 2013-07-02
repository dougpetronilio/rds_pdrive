require 'net/http'
require 'uri'
require 'json'

module RdsPdrive
  class Integrator
    attr_reader :token, :leads
    def initialize(email, password)
      @email = email
      @password = password
      @url = "https://api.pipedrive.com/v1/" 
      authenticate
      @leads = []
    end
    
    def get_all_leads

      uri = URI.parse("#{@url}persons?api_token=#{@token}")
      response = Net::HTTP.get(uri)
      objeto_json = JSON.parse(response)
      data = objeto_json['data']
      @leads = []
      if data
        data.each do |d|
          lead = Lead.new(d['name'], "", d['email'][0]['value'], "", d['phone'][0]['value'])
          @leads << lead
        end
      end
      @leads
    end
    
    def add_lead(lead)
      uri = URI.parse("#{@url}persons?api_token=#{@token}")
      response = Net::HTTP.post_form(uri, {"name" => lead.full_name, "email" => lead.email, "phone" => lead.phone, "company_id" => @company_id})
      objeto_json = JSON.parse(response.body)
    end
    
    def find_by_name(name)
      get_all_leads
      @leads.select { |l| l.name == name}
    end
    
    private
    def authenticate
      uri = URI.parse(@url+"authorizations")
      response = Net::HTTP.post_form(uri, {"email" => @email, "password" => @password})
      objeto_json = JSON.parse(response.body)
      if objeto_json['success'] == true
        @token = objeto_json['data'][0]['api_token']
        @user_id = objeto_json['data'][0]['user_id']
        @company_id = objeto_json['data'][0]['company_id']
      end
    end
  end
end