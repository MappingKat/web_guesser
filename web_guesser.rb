require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101).to_i

get '/' do
guess = params["guess"].to_i

  if SECRET_NUMBER + 20 < guess
    message = "Damn....Way TOO HIGH"
  elsif SECRET_NUMBER - 20 > guess
    message = "Waaaay... TOO Low"
  elsif SECRET_NUMBER > guess
    message = "...too Low"
  elsif SECRET_NUMBER < guess
    message = "...too High"
  elsif SECRET_NUMBER == guess
    message = "Ding! Ding! You got it! Ding! Ding!"
  end
  erb :index2, :locals => {:number => SECRET_NUMBER, :message => message}
end
