require 'sinatra/base'
require './lib/link'
require './database_connection_setup'
require 'sinatra/flash'
require './lib/database_connection'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect 'links'
  end

  get '/links' do
    @links = Link.all
    erb :"links/index"
  end

  get '/links/new' do
    erb :"links/new"
  end

  post '/links' do
    successful = Link.create(params[:url], params[:title])
    if successful
      redirect '/links'
    else
      flash[:notice] = "That is not a valid url."
      redirect '/links/new'
    end
  end

  post '/links/:id/delete' do
    Link.delete(params[:id])
    redirect '/links'
  end

  get '/links/:id/update' do
    @link = Link.find(params[:id])
    erb :"links/edit"
  end

  post '/links/:id/update' do
    Link.edit(params[:id], params[:edit_url], params[:edit_title])
    Link.all
    redirect '/'
  end




   run! if app_file == $0

end
