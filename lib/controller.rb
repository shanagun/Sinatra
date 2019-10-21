require 'gossip'

class ApplicationController < Sinatra::Base # La classe ApplicationController hérite de la classe Sinatra::Base (la classe ApplicationController aura toutes les fonctionnalités de Sinatra::Base)
  
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end
  
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/' # Redirige vers la page d'accueil 
  end

  get '/gossips/:id/' do
    params[:id]
    erb :show, locals: {gossips: Gossip.find(params[:id].to_i)}
  end

  get 'gossips/:id/edit' do
    erb :edit
  end

end