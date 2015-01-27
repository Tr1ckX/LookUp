class LookUp < Sinatra::Base

  get '/thankyou' do
    @roof = Roof.find(session[:roof_id])
    erb :thankyou
  end

  post '/useremail' do
    roof = Roof.find(session[:roof_id])
    roof.set_user_email(params[:email])
    send_email_with_link(roof)
    redirect to 'http://www.1010global.org/uk'
  end

end
