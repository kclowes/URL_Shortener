require 'sinatra'
require 'sinatra/base'

class App < Sinatra::Application
  ORIGINAL_URL=[]

  get '/' do
    erb :index, :locals => { :url_to_be_shortened => ORIGINAL_URL }
  end

  get '/shorten' do
    erb :shorten
  end

  post '/' do
    ORIGINAL_URL << params[:url_to_be_shortened]
  end

end