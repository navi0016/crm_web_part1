require_relative 'contact'
require 'sinatra'

get '/' do
    @contacts_page = '/contacts'
    @about_me_page = '/about_me'
  erb :index

end

get '/contacts' do
  @contacts = Contact.all
  @size = Contact.all.size
  @home_page = '/'
  @about_me_page = '/about_me'
  erb :contacts
end

get '/about_me' do
  @contacts_page = '/contacts'
  @home_page = '/'
  erb :about_me
end

get '/contacts/new' do
  erb :new
end

post '/contacts' do
  Contact.create(first_name: params[:first_name],last_name: params[:last_name],email: params[:email],note: params[:note])
  redirect to('/contacts')
end
get '/contacts/search' do
  @contacts = Contact.where("LOWER(first_name)=?", params[:search].downcase)
  erb :search
end

get '/contacts/:id' do
  @home_page = '/'
  @about_me_page = '/about_me'
  @contacts_page = '/contacts'
  @contact = Contact.find_by({id: params[:id].to_i})

  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end


get '/contact/:id/edit' do
  @home_page = '/'
  @about_me_page = '/about_me'
  @contacts_page = '/contacts'
    @contact = Contact.find_by({id: params[:id].to_i})
    if @contact
      erb :edit_contact
    else
      raise Sinatra::NotFound
    end
end

put '/contacts/:id' do
  @home_page = '/'
  @about_me_page = '/about_me'
  @contacts_page = '/contacts'

  @contact = Contact.find_by(id: params[:id].to_i)
    if @contact

      if params[:status] == 'on'
         @status=true
       else
         @status=false
       end
      @contact.update(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note],
    status:     @status
    )

    redirect to('/contacts')
    else
    raise Sinatra::NotFound
    end
end



delete '/contacts/:id' do
  @home_page = '/'
  @about_me_page = '/about_me'
  @contacts_page = '/contacts'

  @contact = Contact.find(params[:id].to_i)

    if @contact
    @contact.delete
    redirect to('/contacts')
    else
    raise Sinatra::NotFound
    end
end





after do
  ActiveRecord::Base.connection.close
end
