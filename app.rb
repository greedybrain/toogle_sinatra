require_relative 'config/environment'
require_relative './models/scraper'
require_relative './models/query'

class App < Sinatra::Base
    # configure do
    #     set :views, "./views"
    #     set :public_dir, "./public"
    # end

    get '/' do 
        erb :index
    end

    post '/results' do 
        @search = params[:search]
        @queried_data_created = Query.create(@search)
        @search_results = Query.all
        erb :results
    end

end