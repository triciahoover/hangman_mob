# puts "Welcome to Hangman."

def secret_word()
	
	
end 



def game_over?()
	@turns == 0
end

def play_game()
	@guessed_letters = []
	# puts "you have #{@turns} turns left."
	# puts "your word is #{@correct_answers}."
	# print "Please enter a letter:"
	
	loop do
		@secret_word_array.each_with_index do |value, key|
			if letter == value
				@correct_answers_array[key] = letter
			end
		end	
		if @secret_word_array.include?(letter)
			#puts "you guessed a correct letter"
		else
			#puts "sorry, that letter is not in the word"
			@turns -= 1
			#puts "you have #{@turns} left"
		end

		@guessed_letters.push(letter)
		#puts "You have used the following letters: #{@guessed_letters}"

			p @correct_answers_array
			if game_over?()
				#puts "Sorry, you have lost the game.  The word was #{@secret_word}"
				break
			elsif @correct_answers_array == @secret_word_array
				#puts "You have won the game"
				break
			end
	end
end


