require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101).to_i
@color = 'white'

def color
  end

def check_guess(guess)
  if SECRET_NUMBER + 20 < guess
    @color = 'red'
    message = "Damn....Way TOO HIGH"
  elsif SECRET_NUMBER - 20 > guess
    @color = 'navy'
    message = "Waaaay... TOO Low"
  elsif SECRET_NUMBER > guess
    message = "...too Low"
    @color = 'blue'
  elsif SECRET_NUMBER < guess
    message = "...too High"
    @color = 'pink'
  elsif SECRET_NUMBER == guess
    message = "Ding! Ding! You got it! Ding! Ding!"
    @color = 'green'
  end
  message
end

get '/' do
  guess = params["guess"]
  if guess
    message = check_guess(guess.to_i)
  else
    message = 'Pick a number between 1 and 100'
  end
  
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :color => @color}
end
