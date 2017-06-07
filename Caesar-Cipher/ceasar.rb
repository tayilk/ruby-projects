def caesar_cipher(words, shift)

	output = ""
	words = words.split("")
	
	upcase_range = ("A".."Z")
	lowcase_range = ("a".."z")

	words.each do |letter|

		char_num = letter.ord

		if upcase_range.include?(letter)
			char_num += shift

			if char_num > 90
				char_num = 64 + (char_num - 90)
			end
			output += char_num.chr

		elsif lowcase_range.include?(letter)
			char_num += shift

			if char_num > 122
				char_num = 96 + (char_num - 122)
			end
			output += char_num.chr
		else
			output += letter
		end
	end
	puts output
end

caesar_cipher("Please encode this message!", 5)