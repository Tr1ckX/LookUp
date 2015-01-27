class LookUp < Sinatra::Base

  get '/shading' do
    erb :shading
  end

  post '/shading_data' do
    Roof.find(session[:roof_id]).set_shade_value(params[:shade_value].to_i)
    redirect to '/summary'
  end

end