module Enumerable
	def my_each
		x = 0

		while x < self.size
			yield(self[x])
			x += 1
		end
		self
	end

	def my_each_with_index
		x = 0

		while x < self.size
			yield(self[x], x)
			x +=1
		end
		self
	end

	def my_select
		arr = []
		x = 0

		while x < self.size
			if yield(self[x])
				arr.push(self[x])
			end
			x += 1
		end
		arr
	end
end