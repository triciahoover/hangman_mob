require 'sinatra'
require_relative 'hangman.rb'


get '/' do
	word = ["jacuzzi", "zombies"]
	secret_word = word.sample
	puts secret_word
	correct_word = "-" * secret_word.length
	puts correct_word
	turns = "8"
	puts turns
	guessed_letters = " "
	puts guessed_letters
	puts guessed_letters.class 
	erb :home, :locals => {:secret_word => secret_word, :correct_word => correct_word, :turns => turns, :guessed_letters => guessed_letters}
end

post '/letter_choice' do
	letter = params[:letter]
	puts letter
	secret_word = params[:secret_word]
	puts secret_word
	correct_word = params[:correct_word]
	puts correct_word
 	turns = params[:turns]
 	puts turns
	guessed_letters = params[:guessed_letters]
	puts guessed_letters
	redirect '/gameplay?letter=' + letter + '&secret_word=' + secret_word + '&correct_word=' + correct_word + '&turns=' + turns + '&guessed_letters=' + guessed_letters
end
	
get '/gameplay' do
	letter = params[:letter]
	secret_word = params[:secret_word]
	correct_word = params[:correct_word]
 	turns = params[:turns]
	guessed_letters = params[:guessed_letters]
	erb :play_game, :locals => {:letter => letter, :secret_word => secret_word, :correct_word => correct_word, :turns => turns, :guessed_letters => guessed_letters}
end