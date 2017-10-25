require 'sinatra'
require 'sinatra/reloader'

x = rand(100)

get '/' do 	
	"THE SECRET NUMBER is #{x}"
end