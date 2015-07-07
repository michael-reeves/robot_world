require 'models/robot_manager'

class RobotWorldApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')

  get '/' do
    haml :dashboard
  end

  # Create
  get '/robots/new' do
    haml :new
  end

  post '/robots' do
    RobotManager.create(params[:robot])
    redirect '/robots'
  end

  # Read
  get '/robots' do
    @robots = RobotManager.all
    haml :index
  end

end
