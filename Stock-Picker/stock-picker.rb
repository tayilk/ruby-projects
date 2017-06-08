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

	puts "Best day to buy: " +  best_picks[0].to_s
	puts "Best day to sell: " + best_picks[1].to_s
	puts "Profit: $" + best_profit.to_s
end

stock_picker([58, 65, 77, 82, 66, 44, 33, 35, 40, 55, 48])