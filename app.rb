require 'sinatra'
require 'sinatra/base'

class App < Sinatra::Application

  URL_ARRAY=[]
  OUTPUT_ARRAY=[]

  get '/' do
    erb :index
    #:locals => { :url_to_be_shortened => ORIGINAL_URL }
  end

  get '/shorten' do
    erb :shorten
  end

  post '/' do
    url_tbs = params[:url_to_be_shortened]
    URL_ARRAY << url_tbs
    id = URL_ARRAY.index(url_tbs) + 1
    OUTPUT_ARRAY << ("http://lit-river-4368.herokuapp.com/#{id}")
    redirect '/shorten'
  end

end