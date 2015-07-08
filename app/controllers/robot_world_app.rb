require 'models/robot_manager'

class RobotWorldApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true

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

  get '/robots/:id' do |id|
    @robot = RobotManager.find(id.to_i)
    haml :show
  end

  # Update
  get '/robots/:id/edit' do |id|
    @robot = RobotManager.find(id.to_i)
    haml :edit
  end

  put '/robots/:id' do |id|
    RobotManager.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  # Delete
  delete '/robots/:id' do |id|
    RobotManager.delete(id.to_i)
    redirect '/robots'
  end

  not_found do
    haml :error
  end
end
