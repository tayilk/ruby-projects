load './game.rb'

print "Player 1 please enter your name: "
p1 = gets.chomp

print "Player 2 please enter your name: "
p2 = gets.chomp

x = Game.new(p1, p2)
x.start