require 'sinatra/base'

class App < Sinatra::Application

  URL_ARRAY=[]
  OUTPUT_ARRAY=[]

  enable :sessions

  get '/' do
    erb :index
  end

  get '/shorten' do
    erb :shorten
  end

  post '/' do
    url_tbs = params[:url_to_be_shortened]
    if url_tbs.start_with?("http")
      URL_ARRAY << url_tbs
      id = URL_ARRAY.index(url_tbs) + 1
      output = request.scheme + "://" + request.host_with_port + "/#{id}"
      OUTPUT_ARRAY << output
      redirect '/shorten'
    elsif url_tbs.start_with?(" ")
      @error_message="URL cannot be blank"
      erb :index
    else
      @error_message="The text you entered is not a valid URL"
      erb :index
    end
    end

  get '/:id' do
    redirect URL_ARRAY.last
  end

end