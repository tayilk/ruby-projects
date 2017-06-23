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

	def my_map(p=nil)
		x = 0
		new_arr = []

		if p
			while x < self.size
				new_arr.push(p.call(self[x]))
				x += 1
			end
		else

			while x < self.size
				new_arr.push(yield(self[x]))
				x += 1
			end
		end
		new_arr
	end

	def my_inject(first=0, second=nil)
		sum = first
		x = 0

		if block_given?
			while x < self.size
				sum = yield(sum, self[x])
				x += 1
			end
		elsif first.instance_of?(Symbol)
			sum = 1
			sum = 0 unless first == :* || first == :/
			sym = first.to_s

			while x < self.size
				sum = sum.send(sym, self[x])
				x += 1
			end
		elsif second
			sym = second.to_s

			while x < self.size
				sum = sum.send(sym, self[x])
				x += 1
			end
		end
		sum
	end
end

def multiply_els(arr)
	arr.my_inject(:*)
end