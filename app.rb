require 'sinatra'
require 'sinatra/base'

class App < Sinatra::Application

  get '/' do
    erb :index, :locals => { :name => :url_to_be_shortened }
  end

  get '/shorten' do
    erb :shorten
  end

end