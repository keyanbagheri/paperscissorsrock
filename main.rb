require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb :index
end

get '/play/:selection' do
	computer_pick = ["Rock", "Paper", "Scissors"].sample
	user_pick = params[:selection].capitalize
	if computer_pick == user_pick
		@result = "Tie"
		@victory = false
	elsif computer_pick == "Rock"
		if user_pick == "Scissors"
		@result = "Your scissors were overpowered by that oldest tool of man. The Rock."
		@victory = false
		else
		@result = "Some sort of scorcery allows you to defeat the mighty rock, \nwith a sheet of flimsy paper?"
		@victory = true
		end
	elsif computer_pick == "Paper"
		if user_pick == "Rock"
			@result = "What is this. Your rock is twarted by a sheet of paper?"
			@victory = false
		else
			@result = "You made a sharp choice and it paid off"
			@victory = true
		end
	else
		if user_pick == "Paper"
			@result = "The pen may be mightier than the sword, \nbut the pad is no match for sharpened metal."
			@victory = false
		else
			@result = "You enjoy smashing things with rocks a bit too much. \nYou must not have had many toys as a child."
			@victory = true
		end
	end

	erb :play
end
