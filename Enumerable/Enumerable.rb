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

	
	def my_all?
		x = 0

		while x < self.size
			unless yield(self[x])
				return false
			end
			x += 1
		end
		return true
	end

	def my_any?
		x = 0

		while x < self.size
			if yield(self[x])
				return true
			end
			x += 1
		end
		false
	end

	def my_none?
		x = 0

		while x < self.size
			if yield(self[x])
				return false
			end
			x += 1
		end
		true
	end

	def my_count(num=nil)
		x = 0
		count = 0

		while x < self.size
			if block_given?
				if yield(self[x])
					count += 1
				end
			elsif num
				if self[x] == num
					count += 1
				end
			else
				return self.size
			end
			x += 1
		end
		return count
	end
end