# Import pliku (tower.rb) z tego samego katalogu
require_relative 'tower.rb'

# Podanie przez użytkownika liczby dysków
print "Podaj liczbe dyskow: "
n = gets.chomp
until n =~ /^\d+$/
  puts "Niepoprawny format! (Tylko liczby całkowite)"
  print "Podaj liczbe dyskow: "
  n = gets.chomp
end
n = Integer(n)

# Inicjacja klasy Tower i rozpoczęcie układania
tower = Tower.new(n)
tower.display
tower.hanoi(n,:A,:B,:C)
print "\e[?25h"
