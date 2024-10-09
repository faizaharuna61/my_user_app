# app.rb
require 'sinatra'
require 'json'
require_relative 'my_user_model'

enable :sessions

user_model = User.new

get '/users' do
  content_type :json
  users = user_model.all
  users.each { |id, user| user.delete(:password) }
  users.to_json
end

post '/users' do
  user_info = { firstname: params[:firstname], lastname: params[:lastname], age: params[:age], password: params[:password], email: params[:email] }
  user_id = user_model.create(user_info)
  user = user_model.find(user_id)
  user.delete(:password)
  user.to_json
end

post '/sign_in' do
  email, password = params[:email], params[:password]
  user = user_model.all.values.find { |user| user[:email] == email && user[:password] == password }
  if user
    session[:user_id] = user[:id]
    response.set_cookie 'rack.session', value: session[:user_id], path: '/'
    user.delete(:password)
    user.to_json
  else
    status 401
    { error: 'Invalid email or password' }.to_json
  end
end

put '/users' do
  require_login
  user_model.update(session[:user_id], 'password', params[:password])
  user = user_model.find(session[:user_id])
  user.delete(:password)
  user.to_json
end

delete '/sign_out' do
  require_login
  session.clear
  status 204
end

delete '/users' do
  require_login
  user_model.destroy(session[:user_id])
  session.clear
  status 204
end

def require_login
  halt 401, { error: 'Unauthorized' }.to_json unless session[:user_id]
end

set :views, './views'

get '/' do
  erb :index
end
