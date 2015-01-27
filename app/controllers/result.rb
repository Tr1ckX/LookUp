class LookUp < Sinatra::Base

  get '/result' do
    @roof = Roof.find(session[:roof_id])
    @roof.set_capacities
    erb :result
  end

end