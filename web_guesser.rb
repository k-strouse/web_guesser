require 'sinatra'
require 'sinatra/reloader' if development?

@@number = rand(100)




get '/' do 	
	user_guess = params['guess'].to_i
	guesser = check_guess(user_guess)
	erb :index, :locals => {:number 		=> @@number, 
													:guess 			=> user_guess,
													:message		=> @message,
													:bg_color   => @bg_color,
													:guesser		=> @guesser}
end

def check_guess(user_guess)
	if (user_guess - 5) > @@number
		@message = "Way too high!"
		@bg_color = "#ff1a1a"
	elsif user_guess > @@number
		@message = "Too high!"
		@bg_color = "#ff9999"
	elsif (user_guess + 5) < @@number
		@message = "Way too low!"
		@bg_color = "#ff1a1a"			
	elsif user_guess < @@number
		@message = "You guessed to low!"
		@bg_color = "#ff9999"
	elsif user_guess == @@number
		@message = "You got it right! The secret number is #{@@number}"
		@bg_color = "#009933"
	elsif user_guess == " ".to_i
		@message = "Please enter a number"
	end
end

