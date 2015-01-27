require 'sinatra'
require 'data_mapper'
require 'aws/s3'
require 'rack-flash'
require 'require_all'
require 'mailgun'
require 'json'

require_relative 'models/roof'
require_relative 'data_mapper_setup'

require_rel 'helpers'
require_rel 'controllers'

class LookUp < Sinatra::Base

  use Rack::Flash
  set :views, File.join(root, '..', 'views')
  set :public_dir, File.join(root, '../..', 'public')
  enable :sessions
  set :session_secret, 'super secret'

  run! if app_file == $0

end
