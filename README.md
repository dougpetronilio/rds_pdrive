# RdsPdrive

RdsPdrive is a gem for make integration of application RD_station and CRM PipeDrive.
This gem implemented this functionality: 
Authentication with email and password in pipedrive;
Add a lead to pipedrive
List all leads of the authenticated account

## Installation

Add this line to your application's Gemfile:

    gem 'rds_pdrive'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rds_pdrive

## Usage

For Authenticated in account is passed the email and password in the construtor of the class Integrator as in the example:

	integrator = Integrator.new('emailteste@gmail.com', 'pass123pass')

For list all persons of the authenticated account use the function get_all_leads of the class Integrator as in the example:

	list_of_my_leads = integrator.get_all_leads
	
For add a lead to authenticated account use the function add_lead of the class Integrator as in the example:

	lead = Lead.new("name", "last_name", "email", "company", "99229922")
	integrator.add_lead(lead)

For find a lead in authenticated account use tha function find_by_name of the class Integrator as in the example:

	lead = integrator.find_by_name("name")