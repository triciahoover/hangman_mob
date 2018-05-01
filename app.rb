require 'sinatra'
require_relative 'hangman.rb'

# $wrong_guess_count = 0
# $all_guess_letters = []

get '/' do
	word = ["jacuzzi", "zombies", "awkward", "shallow","species", "buffalo", "cobwebs",
	"jackpot","jukebox", "keyhole", "puzzled","zigzags", "zodiacs", "buzzard", 
	"alfredo", "antique", "bagpipe", "balloon","bandana", "cabbage", "caboose", 
	"calvary", "dessert", "dolphin", "earmuff", "earring", "emerald", "indulge",
	"jasmine", "orchids"]
	@turns = 7     
	secret_word = word.sample
	correct_answers = "-" * @secret_word.length
	erb :home, :locals => {:secret_word => secret_word, :correct_answers => correct_answers}
end

post '/letter_choice' do
	letter = params[:letter]
	secret_word = params[:secret_word]
	correct_answers = params[:correct_answers]
	redirect '/gameplay?letter=' + letter + '&secret_word=' + secret_word + '&correct_answers=' + correct_answers
end
	
get '/gameplay' do
	letter = params[:letter]
	secret_word = params[:secret_word]
	correct_answers = params[:correct_answers]
	secret_word_array = @secret_word.split('')
	correct_answer_array = @correct_answers.split('')
	erb :play_game, :locals => {:letter => letter, :secret_word => secret_word}
end

