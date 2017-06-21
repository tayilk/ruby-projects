def bubble_sort(arr)
	l = arr.length

	until l == 0
		down = 0
		1.upto(l - 1) do |i|
			if arr[i - 1] > arr[i]
				arr[i - 1], arr[i] = arr[i], arr[i - 1]
				down = i
			end
		end
		l = down
	end

	arr
end

sort_this = [2, 6, 7, 3, 2, 5, 8, 7, 5]

p bubble_sort(sort_this)