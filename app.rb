require 'sinatra/base'
require './lib/link'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    @links = Link.all
    erb :index
  end

  get '/new-link' do
    erb :new_link
  end

  post '/create' do
    Link.create(url: params['url'])
    redirect '/'
  end

   run! if app_file == $0

end
