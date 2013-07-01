module RdsPdrive
  class Lead
    attr_reader :name, :last_name, :email, :company, :phone
    def initialize(name, last_name, email, company, phone)
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