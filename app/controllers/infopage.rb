class LookUp < Sinatra::Base

  get '/infopage' do
    roof = Roof.create_record
    session[:roof_id] = roof.id
    erb :infopage
  end

end