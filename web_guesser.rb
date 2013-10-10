require 'sinatra'
require 'sinatra/reloader'

get '/' do
    rand(99)
    "Your lucky number is #{rand(99)}"
end
