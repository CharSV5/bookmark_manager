require 'sinatra/base'
require './lib/link'
require './database_connection_setup'
require 'sinatra/flash'
require './lib/database_connection'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @links = Link.all
    erb :index
  end

  get '/new-link' do
    erb :new_link
  end

  post '/create' do
    successful = Link.create(params[:url], params[:title])
    if successful
      redirect '/'
    else
      flash[:notice] = "That is not a valid url."
      redirect '/new-link'
    end
  end

  post '/delete' do
    Link.delete(params[:id])
    redirect '/'
  end

  get '/edit' do
    session[:id] = params[:id]
    erb :edit
  end

  post '/update-a-link' do
    Link.edit(params[:id], params[:url], params[:title])
    Link.all
    redirect '/'
  end

   run! if app_file == $0

end
