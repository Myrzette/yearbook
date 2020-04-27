class ApplicationController < Sinatra::Base

  require 'gossip'
  
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  
  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossip/:id' do
    erb :show, locals: {gossip: Gossip.find(params["id"], num: params["id"]}
  end

end