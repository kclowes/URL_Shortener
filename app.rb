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
    output = request.scheme + "://" + request.host_with_port + "/#{id}"
    OUTPUT_ARRAY << output
    redirect '/shorten'
  end

  get '/:id' do
    redirect URL_ARRAY.last
  end

end