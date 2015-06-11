class Stock

	attr_accessor :name, :target, :actual, :shares, :price

	def initialize(name, target, actual, shares, price)
		@name 	= name
		@target = target
		@actual = actual
		@shares = shares
		@price 	= price
	end

	#check for share value by multiplying price and share amount
	def share_value(price, shares)
		price * shares
	end

	#check for difference in target and actual percentages and then execute buy_and_sell method
	def target_diff(target, actual)
		x = target - actual
		buy_and_sell(x)
	end

	def buy_and_sell(target_diff)
		@d = target_diff

		if @d > 0
			buy_stock = (((TOTAL / 100) * @d) / price).to_i
			if buy_stock > 1
				print "Buy #{buy_stock} shares of #{name}. "
			end 
		else @d < 0
			sell_stock = (((TOTAL / 100) * @d) / price).to_i.abs
			if sell_stock > 1 
				print "Sell #{sell_stock} shares of #{name}. "
			end
		end
	end	

end

## Create three new stock objects

s1 = Stock.new("GOOG", 60.0, 50.96, 52, 98)
s2 = Stock.new("APPL", 30.0, 29.92, 136, 22)
s3 = Stock.new("TSLA", 10.0, 19.12, 239, 8)

## Not a fan of using a global but I found this to be the easiest with the amount of time I had

TOTAL = s1.share_value(s1.price, s1.shares) + s2.share_value(s2.price, s2.shares) + s3.share_value(s3.price, s3.shares) 

## Call the target diff method to which enables buy and sell method to decide on which action to pursue

s1.target_diff(s1.target, s1.actual)
s2.target_diff(s2.target, s2.actual)
s3.target_diff(s3.target, s3.actual)