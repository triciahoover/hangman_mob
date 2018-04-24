puts "Would you like to play Hangman?"
answer = gets.chomp 
puts "Great! Here is your word and good luck!"

def secret_word()
	@turns = 7   
	@word = ["jacuzzi", "zombies", "awkward", "shallow","species", "buffalo", "cobwebs",
	"jackpot","jukebox", "keyhole", "puzzled","zigzags", "zodiacs", "buzzard", 
	"alfredo", "antique", "bagpipe", "balloon","bandana", "cabbage", "caboose", 
	"calvary", "dessert", "dolphin", "earmuff", "earring", "emerald", "indulge",
	"jasmine", "orchids"]        
	@secret_word = @word.sample
	@secret_word_array = @secret_word.split('')
	puts @secret_word
	@correct_answers = "-" * @secret_word.length
	@correct_answers_array = @correct_answers.split('')
end 

secret_word()

def game_over?()
	@turns == 0
end

def play_game()
	@guessed_letters = []
	puts "you have #{@turns} turns left."
	puts "your word is #{@correct_answers}."
	print "Please enter a letter:"
	loop do
		letter = gets.chomp
		@secret_word_array.each_with_index do |value, key|
			if letter == value
				@correct_answers_array[key] = letter
			end
		end	
		if @secret_word_array.include?(letter)
			puts "you guessed a correct letter"
			@guessed_letters.push(letter)
		else
			puts "sorry, that letter is not in the word"
			@turns -= 1
			puts "you have #{@turns} left"
		end
			
		p @correct_answers_array
			if game_over?()
				puts "Sorry, you have lost the game.  The word was #{@secret_word}"
				break
			elsif @correct_answers_array == @secret_word_array
				puts "You have won the game"
				break
			end
	end
end

play_game()
