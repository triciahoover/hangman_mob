require 'sinatra'
require_relative 'hangman.rb'


get '/' do
	word = ["jacuzzi", "zombies", "awkward", "shallow","species", "buffalo", "cobwebs",
	"jackpot","jukebox", "keyhole", "puzzled","zigzags", "zodiacs", "buzzard", 
	"alfredo", "antique", "bagpipe", "balloon","bandana", "cabbage", "caboose", 
	"calvary", "dessert", "dolphin", "earmuff", "earring", "emerald", "indulge",
	"jasmine", "orchids"]
	secret_word = word.sample
	correct_answers = "-" * secret_word.length
	turns = "7"  
	erb :home, :locals => {:secret_word => secret_word, :correct_answers => correct_answers, :turns => turns}
end

post '/letter_choice' do
	letter = params[:letter]
	secret_word = params[:secret_word]
	correct_answers = params[:correct_answers]
	turns = params[:turns]
	redirect '/gameplay?letter=' + letter + '&secret_word=' + secret_word + '&correct_answers=' + correct_answers + '&turns=' + turns
end
	
get '/gameplay' do
	letter = params[:letter]
	secret_word = params[:secret_word]
	correct_answers = params[:correct_answers]
	turns = params[:turns]
	erb :play_game, :locals => {:letter => letter, :secret_word => secret_word, :correct_answers => correct_answers, :turns => turns}
end

