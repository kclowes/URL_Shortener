require 'sinatra'
require 'sinatra/base'

class App < Sinatra::Application

  URL_HASH={}

  get '/' do
    erb :index
    #:locals => { :url_to_be_shortened => ORIGINAL_URL }
  end

  get '/shorten' do
    erb :shorten
  end

  post '/' do
    URL_HASH[:url] = params[:url_to_be_shortened]
    URL_HASH[:url => params[:output]]
    redirect '/shorten'
  end

end