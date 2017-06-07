def stock_picker(stock_arr)

	sell = 1
	buy = 0
	best_profit = 0
	best_picks = []

	while buy < stock_arr.length do 

		while sell < stock_arr.length do

			profit = stock_arr[sell] - stock_arr[buy]

			if profit > best_profit
				best_profit = profit
				best_picks = [buy, sell]
			end

			sell += 1
		end
		sell = buy + 1
		buy += 1
	end

	puts best_picks
end

stock_picker([58, 65, 77, 82, 66, 44, 33, 35, 40, 55, 48])