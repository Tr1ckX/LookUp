class LookUp < Sinatra::Base

  get '/material' do
    erb :material
  end

  post '/material_data' do
    Roof.find(session[:roof_id]).set_material(params[:material])
    redirect to '/shading'
  end

end
