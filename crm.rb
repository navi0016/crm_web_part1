require_relative 'contact'
require 'sinatra'

get '/' do
    @contacts_page = '/contacts'
    @about_me_page = '/about_me'
  erb :index

end

get '/contacts' do
  @contacts = Contact.all
  @home_page = '/'
  erb :contacts
end

get '/about_me' do
  @contacts_page = '/contacts'
  @home_page = '/'
  erb :about_me
end

after do
  ActiveRecord::Base.connection.close
end
