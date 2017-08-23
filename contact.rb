gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm-ar.sqlite3')


class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  def full_name
   "#{ first_name } #{ last_name }"
 end

  
end

Contact.auto_upgrade!
# contact1 = Contact.new('Betty', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
# p contact.email
# contact.note = "Loves HTMl & CSS"
# p contact

# bobby = Contact.create('bobby','brown','bobby@brown','wow')
# sue = Contact.create('sue','suzy','sue@suzy','cool')
# jim = Contact.create('jim','jimmy','jim@jimmy','amazing')
# # bobby.update('first_name','bill')
# bobby.update('last_name','clinton')

# p bobby.full_name

# Contact.delete_all

# hillary = Contact.create('silly','girl','silly@girl','try_harder')

# p Contact.all

# bobby.delete

# p Contact.all
