module RdsPdrive
  class Lead
    attr_accessor :name, :last_name, :email, :company, :phone
    def initialize(name = nil, last_name = nil, email = nil, company = nil, phone = nil)
      @name = name
      @last_name = last_name
      @email = email
      @company = company
      @phone = phone
    end
    
    def full_name
      "#{@name} #{@last_name}"
    end
  end
end