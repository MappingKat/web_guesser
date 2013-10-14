require 'sinatra'
require 'sinatra/reloader'

secret = (1 + rand(99)).to_s
puts secret

get '/' do
  final_guess = false

  if secret.to_i + 20 < params["guess"].to_i 
    guess = "Damn....Way TOO HIGH"
  elsif secret.to_i - 20 > params["guess"].to_i 
    guess = "Waaaay... TOO Low"
  elsif secret.to_i > params["guess"].to_i
    guess = "...too Low"
  elsif secret.to_i < params["guess"].to_i
    guess = "...too High"
  elsif secret.to_i == params["guess"].to_i
    guess = "Ding! Ding! You got it! Ding! Ding!"
    final_guess = true
  end

  if final_guess == true
    right_or_wrong = true
  end

  erb :index, :locals => {:number => secret, :guess => guess, :correct => final_guess, :right_or_wrong => right_or_wrong}
end
