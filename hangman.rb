
def game_over?()
	@turns == 0
end

def win?()
	@secret_word_array = @correct_answers_array
end


