require 'sinatra'
require_relative 'hangman.rb'
enable :sessions


get '/' do
	word = ["jacuzzi", "zombies", "awkward", "shallow","species", "buffalo", "cobwebs", "jackpot","jukebox", "keyhole", "puzzled","zigzags", "zodiacs", "buzzard", "alfredo", "antique", "bagpipe", "balloon","bandana", "cabbage", "caboose", 
	"calvary", "dessert", "dolphin", "earmuff", "earring", "emerald", "indulge",
	"jasmine", "orchids"]
	secret_word = word.sample
	correct_word = "-" * secret_word.length
	secret_word = session[:secret_word]
	correct_answers = session[:correct_word]
	turn = "8"
	turns = session[:turn]  
	erb :home, :locals => {:correct_word => correct_word, :secret_word => secret_word, :correct_answers => correct_answers, :turns => turns}
end

post '/letter_choice' do
	session[:letter] = params[:letter]
	session[:correct_word] = params[:correct_word]
 	session[:secret_word] = params[:secret_word]
	session[:correct_answers] = params[:correct_answers]
	session[:turns] = params[:turns]
	redirect '/gameplay'
end
	
get '/gameplay' do
	letter = session[:letter]
	correct_word = session[:correct_word]
	secret_word = session[:secret_word]
	correct_answers = session[:correct_answers]
	turns = session[:turns]
	erb :play_game, :locals => {:correct_word => correct_word, :letter => letter, :secret_word => secret_word, :correct_answers => correct_answers, :turns => turns}
end