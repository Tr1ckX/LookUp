class LookUp < Sinatra::Base

  get '/desktop/:id' do
    @roof = Roof.find(params[:id])
    erb :desktop
  end

  get '/desktop/json/:id' do
    roof = Roof.find(params[:id])
    {"latitude" => roof.latitude, "longitude" => roof.longitude}.to_json
  end

end
