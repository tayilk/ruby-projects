def substrings(word, dictionary)

	word_arr = word.split(" ")

	word_arr.each do |i|
		i.downcase!
	end

	word_count = Hash.new(1)

	dictionary.each do |current_word|
		
		current_word.downcase!

		word_arr.each do |check_word|

			if check_word.include?(current_word)

				if word_count.include?(current_word)

					word_count[current_word] += 1

				else

					word_count[current_word] = 1

				end

			end

		end

	end

	word_count

end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("Howdy partner, sit down! How's it going?", dictionary)
p substrings("below", dictionary)